import Foundation
import KeyChainManager_KJ

public final class YBTokenManager {
    public static let shared = YBTokenManager()
    public private(set) var accessToken: String?
    public private(set) var refreshToken: String?
       
    private init() {}
    
    public func loadTokenFromKC() async throws {
        guard
            let accessToken = try await KeyChainManagerWithActor.shared.loadString(account: YBConstant.accessToken),
            let refreshToken = try await KeyChainManagerWithActor.shared.loadString(account: YBConstant.refreshToken)
        else { throw YBError.tokenFailure }
        
        self.accessToken = accessToken
        self.refreshToken = refreshToken
    }
    
    // 1. AccessToken이 만료되어 RefreshToken을 사용해 Token정보를 갱신할 때 사용
    // 2. 로그인 성공할 때 사용
    public func saveToken(
        _ token: (
            accessToken: String,
            refreshToken: String
        )
    ) async throws {
        try await KeyChainManagerWithActor.shared.save(string: token.accessToken, account: YBConstant.accessToken)
        try await KeyChainManagerWithActor.shared.save(string: token.refreshToken, account: YBConstant.refreshToken)
        
        accessToken = token.accessToken
        refreshToken = token.refreshToken
    }
    
    public func removeToken() async throws {
        accessToken = nil
        refreshToken = nil
        
        try await KeyChainManagerWithActor.shared.delete(account: YBConstant.accessToken)
        try await KeyChainManagerWithActor.shared.delete(account: YBConstant.refreshToken)
    }
}
