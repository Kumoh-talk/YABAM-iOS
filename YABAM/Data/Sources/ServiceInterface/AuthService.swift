public protocol AuthServiceInterface {
    func loginOAuth(oauthProvider: String, oauthId: String, idToken: String) async throws -> AuthTokenDTO
    func requestKakaoLogin() async throws -> String
}
