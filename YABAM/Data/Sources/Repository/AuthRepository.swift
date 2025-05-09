public protocol AuthRepositoryInterface {
    func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws
}

public struct AuthRepository: AuthRepositoryInterface {
    private let service: AuthServiceInterface
    
    public init(service: AuthServiceInterface) {
        self.service = service
    }
    
    public func loginOAuth(oauthProvider: OAuthProvider, oauthId: String, idToken: String) async throws {
        try await service.loginOAuth(oauthProvider: oauthProvider.rawValue, oauthId: oauthId, idToken: idToken)
    }
}
