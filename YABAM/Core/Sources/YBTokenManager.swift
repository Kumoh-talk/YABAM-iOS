import Foundation
import KeyChainManager_KJ

public final class YBTokenManager {
    public static let shared = YBTokenManager()
    public private(set) var accessToken: String?
    public private(set) var refreshToken: String?
    public private(set) var refreshTokenExpiredAt: Date?
       
    private init() {}
    
    public func loadTokenFromKC() async throws {
        guard
            let accessToken = try await KeyChainManagerWithActor.shared.loadString(account: YBConstant.accessToken),
            let refreshToken = try await KeyChainManagerWithActor.shared.loadString(account: YBConstant.refreshToken),
            let refreshTokenExpiredAtString = try await KeyChainManagerWithActor.shared.loadString(account: YBConstant.refreshTokenExpiredAt)
        else { throw YBError.tokenFailure }
        
        guard let refreshTokenExpiredAt = convertToDate(refreshTokenExpiredAtString), Date() < refreshTokenExpiredAt else {
            try await removeToken()
            throw YBError.refreshTokenFailure
        }
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.refreshTokenExpiredAt = refreshTokenExpiredAt
    }
    
    // 1. AccessToken이 만료되어 RefreshToken을 사용해 Token정보를 갱신할 때 사용
    // 2. 로그인 성공할 때 사용
    public func saveToken(
        _ token: (
            accessToken: String,
            refreshToken: String,
            refreshTokenExpiredAt: String
        )
    ) async throws {
        try await KeyChainManagerWithActor.shared.save(string: token.accessToken, account: YBConstant.accessToken)
        try await KeyChainManagerWithActor.shared.save(string: token.refreshToken, account: YBConstant.refreshToken)
        try await KeyChainManagerWithActor.shared.save(string: token.refreshTokenExpiredAt, account: YBConstant.refreshTokenExpiredAt)
        
        accessToken = token.accessToken
        refreshToken = token.refreshToken
        refreshTokenExpiredAt = convertToDate(token.refreshTokenExpiredAt)
    }
    
    public func removeToken() async throws {
        accessToken = nil
        refreshToken = nil
        refreshTokenExpiredAt = nil
        
        try await KeyChainManagerWithActor.shared.delete(account: YBConstant.accessToken)
        try await KeyChainManagerWithActor.shared.delete(account: YBConstant.refreshToken)
        try await KeyChainManagerWithActor.shared.delete(account: YBConstant.refreshTokenExpiredAt)
    }
    
    private func convertToDate(_ string: String) -> Date? {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
        return formatter.date(from: string)
    }
}
