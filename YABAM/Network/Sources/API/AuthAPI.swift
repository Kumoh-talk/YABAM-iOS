import Alamofire
import Foundation
import YBData

public enum AuthAPI {
    case loginOAuth(provider: String, oauthId: String, idToken: String) // Oauth 로그인
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
        case .loginOAuth:
            return "/v1/auth/oauth/register"
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
        case .loginOAuth(let provider, _, _):
            return ["provider": provider]
        }
    }
    
    public var task: YBTask {
        switch self {
        case .loginOAuth(_, let oauthId, let idToken):
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
        case .loginOAuth:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
