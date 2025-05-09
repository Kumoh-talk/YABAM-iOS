public protocol AuthServiceInterface {
    func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws
}

public struct AuthService: AuthServiceInterface {
    private let provider: YBProvider<AuthAPI>
    
    public init(provider: YBProvider<AuthAPI> = YBProvider<AuthAPI>()) {
        self.provider = provider
    }
    
    public func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws {
        try await provider.requestDecodable(
            .loginOAuth(provider: oauthProvider, oauthId: oauthId, idToken: idToken),
            as: EmptyDecodable.self
        )
    }
}
