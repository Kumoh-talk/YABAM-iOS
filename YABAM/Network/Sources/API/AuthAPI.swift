import Alamofire
import Core
import Foundation

public enum AuthAPI {
    case loginOAuth(provider: String, oauthId: String, idToken: String) // Oauth 로그인
    case fetchUserInfo // 사용자 정보 조회
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
        case .fetchUserInfo:
            return "/api/user"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .loginOAuth:
            return .post
        case .fetchUserInfo:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .loginOAuth,
                .fetchUserInfo:
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
        case .fetchUserInfo:
            return .requestPlain
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .loginOAuth:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        case .fetchUserInfo:
            let headers: HTTPHeaders = [
                .contentType("application/json"),
                .authorization(bearerToken: YBTokenManager.shared.accessToken ?? "")
                ]
            return headers
        }
    }
}
