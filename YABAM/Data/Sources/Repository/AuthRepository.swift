import Core
import KeyChainManager_KJ

public protocol AuthRepositoryInterface {
    func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws
}

public struct AuthRepository: AuthRepositoryInterface {
    private let service: AuthServiceInterface
    
    public init(service: AuthServiceInterface) {
        self.service = service
    }
    
    public func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws {
        let authTokenDTO = try await service.loginOAuth(oauthProvider: oauthProvider.rawValue, oauthId: oauthId, idToken: idToken)
        try await saveToken(response: authTokenDTO)
    }
    
    private func saveToken(response: AuthTokenDTO) async throws {
        let accessToken = response.accessToken
        let refreshToken = response.refreshToken
        let refreshTokenExpiredAt = response.refreshTokenExpiredAt
        let token = (accessToken, refreshToken, refreshTokenExpiredAt)
        try await YBTokenManager.shared.saveToken(token)
    }
}
