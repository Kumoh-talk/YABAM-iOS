import YBData
import KakaoSDKUser
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
    
    public func requestKakaoLogin() async throws -> String {
        if UserApi.isKakaoTalkLoginAvailable() {
            YBLogger.info("카카오톡 앱으로 로그인 인증")
            return try await handleKakaoLoginWithApp()
        } else {
            YBLogger.info("카톡이 설치가 안 되어 웹뷰 실행")
            return try await handleKakaoLoginWithAccount()
        }
    }
    
    private func handleKakaoLoginWithApp() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                
                guard let idToken = oauthToken?.idToken else {
                    continuation.resume(throwing: YBError.oidcFailure)
                    return
                }
                
                continuation.resume(returning: idToken)
            }
        }
    }
    
    private func handleKakaoLoginWithAccount() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error {
                    continuation.resume(throwing: error)
                    return
                }
                guard let idToken = oauthToken?.idToken else {
                    continuation.resume(throwing: YBError.oidcFailure)
                    return
                }
                continuation.resume(returning: idToken)
            }
        }
    }
    
}
