import Alamofire
import Foundation
import Core

final class YBProvider<Target: YBTargetType> {
    private let session: Session

    init(session: Session = .default) {
        self.session = session
    }

    @discardableResult
    func requestDecodable<T: Decodable>(
        _ target: Target,
        as type: T.Type
    ) async throws -> T {
        let request = try target.asURLRequest()
        
        let (data, response): (Data, URLResponse)
        do {
            (data, response) = try await session.session.data(for: request)
        } catch {
            throw error.asYBError
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw YBError.network
        }

        guard (200..<300).contains(httpResponse.statusCode) else {
            throw YBError.server(statusCode: httpResponse.statusCode)
        }

        let wrapper: YBResponse<T>
        do {
            wrapper = try JSONDecoder().decode(YBResponse<T>.self, from: data)
        } catch {
            throw YBError.decoding
        }

        guard wrapper.isSuccess else {
            throw YBError.api(code: wrapper.code, message: wrapper.message)
        }

        guard let value = wrapper.data else {
            throw YBError.decoding
        }

        return value
    }
}
