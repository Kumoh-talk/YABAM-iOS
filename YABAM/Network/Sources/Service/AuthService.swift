import YBData
import Core

public struct AuthService: AuthServiceInterface {
    private let provider: YBProvider<AuthAPI>
    
    public init(provider: YBProvider<AuthAPI> = YBProvider<AuthAPI>()) {
        self.provider = provider
    }
    
    public func loginOAuth(oauthProvider: String, oauthId: String, idToken: String) async throws -> AuthTokenDTO {
        let (oauthResponseDTO, response) = try await provider.requestDecodableWithResponse(
            .loginOAuth(provider: oauthProvider, oauthId: oauthId, idToken: idToken),
            as: OAuthResponseDTO.self
        )
        
        guard let (refreshToken, expiresAt) = response.extractRefreshTokenInfo() else {
            throw YBError.refreshTokenFailure
        }
        
        return AuthTokenDTO(
            accessToken: oauthResponseDTO.accessToken,
            refreshToken: refreshToken,
            refreshTokenExpiredAt: expiresAt
        )
    }
}
