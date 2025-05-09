public struct AuthTokenDTO: Decodable {
    public let accessToken: String
    public let refreshToken: String
    public let refreshTokenExpiredAt: String
    
    public init(
        accessToken: String,
        refreshToken: String,
        refreshTokenExpiredAt: String
    ) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.refreshTokenExpiredAt = refreshTokenExpiredAt
    }
}
