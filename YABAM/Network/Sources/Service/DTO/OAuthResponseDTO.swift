public struct OAuthResponseDTO: Decodable {
    public let accessToken: String
    public let userId: Int
    
    public init(
        accessToken: String,
        userId: Int
    ) {
        self.accessToken = accessToken
        self.userId = userId
    }
}
