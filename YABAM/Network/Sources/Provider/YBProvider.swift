import Alamofire
import Foundation
import Core

public final class YBProvider<Target: YBTargetType> {
    private let session: Session

    public init(session: Session = .default) {
        self.session = session
    }

    @discardableResult
    public func requestDecodable<T: Decodable>(
        _ target: Target,
        as type: T.Type
    ) async throws -> T {
        let request = try target.asURLRequest()
        logRequest(request)

        let (data, response) = try await performRequest(request)
        logResponse(response, data: data)

        try validateResponse(response)

        let wrapper = try decodeWrapper(YBResponse<T>.self, from: data)
        try validateAPIResponse(wrapper)

        guard let value = wrapper.data else {
            throw YBError.decoding
        }

        YBLogger.debug("✅ 디코딩 성공: \(String(describing: value))")
        return value
    }
    
    // MARK: - Private Methods
    
    private func logRequest(_ request: URLRequest) {
        YBLogger.network("🚀 요청: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")\n헤더: \(request.allHTTPHeaderFields ?? [:])\n바디: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "없음")")
    }

    private func performRequest(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            return try await session.session.data(for: request)
        } catch {
            YBLogger.error("❌ 네트워크 오류: \(error.localizedDescription)")
            throw error.asYBError
        }
    }

    private func logResponse(_ response: URLResponse, data: Data) {
        if let httpResponse = response as? HTTPURLResponse {
            YBLogger.network("📩 응답: HTTP \(httpResponse.statusCode)\n응답 바디: \(String(data: data, encoding: .utf8) ?? "nil")")
        } else {
            YBLogger.network("📩 응답: HTTP 정보 없음")
        }
    }

    private func validateResponse(_ response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw YBError.network
        }
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw YBError.server(statusCode: httpResponse.statusCode)
        }
    }

    private func decodeWrapper<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            YBLogger.error("❌ 디코딩 실패: \(error.localizedDescription)")
            throw YBError.decoding
        }
    }

    private func validateAPIResponse<T>(_ response: YBResponse<T>) throws {
        guard response.isSuccess else {
            YBLogger.error("❌ API 실패 응답: \(response.code ?? "-") / \(response.message ?? "-")")
            throw YBError.api(code: response.code, message: response.message)
        }
    }
}
