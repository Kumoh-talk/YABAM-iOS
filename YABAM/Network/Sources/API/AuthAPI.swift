import Alamofire
import Core
import Foundation

public enum AuthAPI {
    case loginOAuth(provider: String, oauthId: String, idToken: String) // Oauth 로그인
    case fetchUserInfo // 사용자 정보 조회
    case logout // 로그아웃
    case refreshToken // 토큰 갱신
}

extension AuthAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        switch self {
        case .loginOAuth,
                .fetchUserInfo:
            return baseURL.appendingPathComponent(YBConstant.authPath)
        case .logout,
                .refreshToken:
            return baseURL.appendingPathComponent(YBConstant.gatewayURL)
        }
        
    }
    
    public var path: String {
        switch self {
        case .loginOAuth:
            return "/api/login"
        case .fetchUserInfo:
            return "/api/user"
        case .logout:
            return "/api/v1/logout"
        case .refreshToken:
            return "/api/v1/refresh"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .loginOAuth,
                .logout,
                .refreshToken:
            return .post
        case .fetchUserInfo:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .loginOAuth,
                .fetchUserInfo,
                .logout,
                .refreshToken:
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
        case .fetchUserInfo,
                .logout,
                .refreshToken:
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
        case .fetchUserInfo,
                .logout:
            let headers: HTTPHeaders = [
                .contentType("application/json"),
                .authorization(bearerToken: YBTokenManager.shared.accessToken ?? "")
                ]
            return headers
        case .refreshToken:
            let headers: HTTPHeaders = [
                .contentType("application/json"),
                .authorization(bearerToken: YBTokenManager.shared.refreshToken ?? "")
            ]
            return headers
        }
    }
}
