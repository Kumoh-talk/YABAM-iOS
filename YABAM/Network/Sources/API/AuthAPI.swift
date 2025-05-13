import Alamofire
import Core
import Foundation

public enum AuthAPI {
    case loginOAuth(provider: String, oauthId: String, idToken: String) // Oauth 로그인
}

extension AuthAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appendingPathComponent(YBConstant.authPath)
    }
    
    public var path: String {
        switch self {
        case .loginOAuth:
            return "/api/login"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .loginOAuth:
            return .post
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .loginOAuth:
            return nil
        }
    }
    
    public var task: YBTask {
        switch self {
        case .loginOAuth(let provider, let oauthId, let idToken):
            return .requestParameters(
                parameters: [
                    "provider": provider.uppercased(),
                    "oauthId": oauthId,
                    "idToken": idToken,
                    "nonce": "nonce"
                ],
                encoding: JSONEncoding.default
            )
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .loginOAuth:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
