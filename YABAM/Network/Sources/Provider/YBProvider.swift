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
        let (value, _) = try await requestDecodableWithResponse(target, as: T.self)
        return value
    }
    
    public func requestDecodableWithResponse<T: Decodable>(
        _ target: Target,
        as type: T.Type
    ) async throws -> (T, HTTPURLResponse) {
        let request = try target.asURLRequest()
        logRequest(request)
        
        let (data, response) = try await performRequest(request)
        logResponse(response, data: data)
        
        try validateResponse(response)
        
        do {
            let wrapper = try decodeWrapper(YBResponse<T>.self, from: data)
            try validateAPIResponse(wrapper)
            
            guard let value = wrapper.data else {
                throw YBError.decoding
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw YBError.invalidResponse
            }
            
            YBLogger.debug("✅ 디코딩 성공: \(String(describing: value))")
            return (value, httpResponse)
            
        } catch let error as YBError {
            switch error {
            case .api(let code, _):
                if code == "SECURITY_0003" || code == "SECURITY_0006" {
                    // 액세스 토큰 만료 → 토큰 리프레시 시도
                    let refreshed = await refreshTokenIfNeeded()
                    if refreshed {
                        return try await requestDecodableWithResponse(target, as: T.self)
                    } else {
                        NotificationCenter.default.post(
                            name: .userRefreshTokenExpired,
                            object: nil
                        )
                        throw YBError.refreshTokenFailure
                    }
                } else if code == "SECURITY_0007" {
                    // 리프레시 토큰 만료 → 로그인 화면으로 이동 노티
                    NotificationCenter.default.post(
                        name: .userRefreshTokenExpired,
                        object: nil
                    )
                    throw YBError.refreshTokenFailure
                }
            default:
                break
            }
            throw error
        }
    }
    
    // MARK: - Private Methods
    
    private func logRequest(_ request: URLRequest) {
#if DEBUG
        YBLogger.network("🚀 요청: \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")\n헤더: \(request.allHTTPHeaderFields ?? [:])\n바디: \(String(data: request.httpBody ?? Data(), encoding: .utf8) ?? "없음")")
#endif
    }
    
    private func performRequest(_ request: URLRequest) async throws -> (Data, URLResponse) {
        do {
            let dataTask = session.request(request)
            let result = await dataTask.serializingData().result
            
            switch result {
            case .success(let value):
                return (value, dataTask.response ?? URLResponse())
            case .failure(let error):
                throw error.asYBError
            }
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
        guard let _ = response as? HTTPURLResponse else {
            throw YBError.network
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
            let code = response.code ?? "알 수 없는 코드"
            let message = response.msg ?? "알 수 없는 오류"
            YBLogger.error("❌ API 실패 응답: \(code) / \(message)")
            throw YBError.api(code: code, message: message)
        }
    }
    
    // MARK: - Token Refresh
    
    private func refreshTokenIfNeeded() async -> Bool {
        do {
            let provider = YBProvider<AuthAPI>()
            guard YBTokenManager.shared.refreshToken != nil else {
                YBLogger.error("❌ 리프레시 토큰 없음")
                return false
            }
            let tokenDto = try await provider.requestDecodable(
                .refreshToken,
                as: JWTTokenDto.self
            )
            
            let (accessToken, refreshToken) = (tokenDto.accessToken, tokenDto.refreshToken)
            
            try await saveToken(accessToken: accessToken, refreshToken: refreshToken)
            
            return true
        } catch {
            YBLogger.error("❌ 토큰 갱신 실패: \(error.localizedDescription)")
            return false
        }
    }
    
    private func saveToken(accessToken: String, refreshToken: String) async throws {
        try await YBTokenManager.shared.saveToken(
            accessToken: accessToken,
            refreshToken: refreshToken
        )
    }
}
