import Core
import KeyChainManager_KJ

public protocol AuthRepositoryInterface {
    func requestKakaoOIDCToken() async throws
    func requestAppleLogin(oauthId: String, idToken: String) async throws
}

public struct AuthRepository: AuthRepositoryInterface {
    private let service: AuthServiceInterface
    
    public init(service: AuthServiceInterface) {
        self.service = service
    }
    
    public func requestKakaoOIDCToken() async throws {
        let idToken = try await service.requestKakaoLogin()
        YBLogger.info("[앱] 카카오로부터 IDToken을 받았습니다.")

        guard let payload = await JWTDecoder.shared.decode(token: idToken),
              let oauthId = payload["sub"] as? String else {
            YBLogger.error("[앱] 카카오 idToken 디코딩 실패 또는 sub 없음")
            throw YBError.oidcFailure
        }

        YBLogger.info("[앱] 디코딩된 oauthId(sub): \(oauthId)")
        let loginUserResponseDTO = try await service.loginOAuth(
            oauthProvider: OAuthProvider.kakao.rawValue,
            oauthId: oauthId,
            idToken: idToken
        )
        try await saveToken(response: loginUserResponseDTO)
    }
    
    public func requestAppleLogin(oauthId: String, idToken: String) async throws {
        let loginUserResponseDTO = try await service.loginOAuth(
            oauthProvider: OAuthProvider.apple.rawValue,
            oauthId: oauthId,
            idToken: idToken
        )
        try await saveToken(response: loginUserResponseDTO)
    }
    
    private func saveToken(response: AuthTokenDTO) async throws {
        let accessToken = response.accessToken
        let refreshToken = response.refreshToken
        let refreshTokenExpiredAt = response.refreshTokenExpiredAt
        let token = (accessToken, refreshToken, refreshTokenExpiredAt)
        try await YBTokenManager.shared.saveToken(token)
    }
}
