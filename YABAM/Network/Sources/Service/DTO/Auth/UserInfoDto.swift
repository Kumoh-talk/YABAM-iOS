public struct UserInfoDto: Decodable {
    public let userId: Int
    public let userNickname: String
    public let userRole: String
    
    public init(
        userId: Int,
        userNickname: String,
        userRole: String
    ) {
        self.userId = userId
        self.userNickname = userNickname
        self.userRole = userRole
    }
}
