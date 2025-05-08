import Foundation
import Alamofire

extension YBTargetType {
    func asURLRequest() throws -> URLRequest {
        var url = baseURL.appendingPathComponent(path)
        
        if let queryParams = queryParameters {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryParams.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            if let finalURL = components?.url {
                url = finalURL
            }
        }
        
        var urlRequest = try URLRequest(url: url, method: method, headers: headers)

        switch task {
        case .requestPlain:
            return urlRequest

        case .requestParameters(let parameters, let encoding):
            return try encoding.encode(urlRequest, with: parameters)

        case .requestJSONEncodable(let encodable):
            let data = try JSONEncoder().encode(AnyEncodable(encodable))
            urlRequest.httpBody = data
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            return urlRequest
        }
    }
}
