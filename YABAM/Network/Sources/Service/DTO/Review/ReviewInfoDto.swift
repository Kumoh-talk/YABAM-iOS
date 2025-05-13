import Foundation

public struct ReviewInfoDto: Decodable {
    public let reviewId: Int
    public let content: String
    public let rating: Int
    public let userId: Int
    public let userNickname: String
    public let createdAt: String
    
    public init(
        reviewId: Int,
        content: String,
        rating: Int,
        userId: Int,
        userNickname: String,
        createdAt: String
    ) {
        self.reviewId = reviewId
        self.content = content
        self.rating = rating
        self.userId = userId
        self.userNickname = userNickname
        self.createdAt = createdAt
    }
}
