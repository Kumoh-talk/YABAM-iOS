import KakaoSDKUser
import Core

public protocol AuthServiceInterface {
    func loginWithKakao() async throws
    func loginWithApple(oauthId: String, idToken: String) async throws
}

public struct AuthService: AuthServiceInterface {
    private let provider: YBProvider<AuthAPI>
    
    public init(provider: YBProvider<AuthAPI> = YBProvider<AuthAPI>()) {
        self.provider = provider
    }

    // MARK: - Public Service Methods
    
    public func loginWithKakao() async throws {
        let idToken = try await requestKakaoIDToken()
        let oauthId = try await decodeOAuthId(from: idToken)
        let authTokenDTO = try await loginOAuth(
            oauthProvider: YBConstant.oauthKakao,
            oauthId: oauthId,
            idToken: idToken
        )
        try await saveToken(response: authTokenDTO)
    }

    public func loginWithApple(oauthId: String, idToken: String) async throws {
        let authTokenDTO = try await loginOAuth(
            oauthProvider: YBConstant.oauthApple,
            oauthId: oauthId,
            idToken: idToken
        )
        try await saveToken(response: authTokenDTO)
    }

    // MARK: - Private Helper Methods
    
    private func requestKakaoIDToken() async throws -> String {
        if UserApi.isKakaoTalkLoginAvailable() {
            return try await loginWithKakaoApp()
        } else {
            return try await loginWithKakaoAccount()
        }
    }

    private func decodeOAuthId(from idToken: String) async throws -> String {
        guard let payload = await JWTDecoder.shared.decode(token: idToken),
              let oauthId = payload["sub"] as? String else {
            throw YBError.oidcFailure
        }
        return oauthId
    }

    private func saveToken(response: AuthTokenDTO) async throws {
        let token = (response.accessToken, response.refreshToken, response.refreshTokenExpiredAt)
        try await YBTokenManager.shared.saveToken(token)
    }

    // MARK: - Networking

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

    // MARK: - Kakao Login Helpers

    private func loginWithKakaoApp() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk { oauthToken, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let idToken = oauthToken?.idToken {
                    continuation.resume(returning: idToken)
                } else {
                    continuation.resume(throwing: YBError.oidcFailure)
                }
            }
        }
    }

    private func loginWithKakaoAccount() async throws -> String {
        try await withCheckedThrowingContinuation { continuation in
            UserApi.shared.loginWithKakaoAccount { oauthToken, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let idToken = oauthToken?.idToken {
                    continuation.resume(returning: idToken)
                } else {
                    continuation.resume(throwing: YBError.oidcFailure)
                }
            }
        }
    }
}
