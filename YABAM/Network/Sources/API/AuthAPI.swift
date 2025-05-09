import Alamofire
import Foundation

public enum AuthAPI {
    public enum OAuthProvider: String, Sendable {
        case apple = "apple"
        case kakao = "kakao"
    }
    
    case loginOauth(provider: OAuthProvider, oauthId: String, idToken: String) // Oauth 로그인
}

extension AuthAPI: YBTargetType {
    public var baseURL: URL {
        guard let url = URL(string: APIConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .loginOauth:
            return "/v1/auth/oauth/register"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .loginOauth:
            return .post
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .loginOauth(let provider, _, _):
            return ["provider": provider.rawValue]
        }
    }
    
    public var task: YBTask {
        switch self {
        case .loginOauth(_, let oauthId, let idToken):
            return .requestParameters(
                parameters: [
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
        case .loginOauth:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
