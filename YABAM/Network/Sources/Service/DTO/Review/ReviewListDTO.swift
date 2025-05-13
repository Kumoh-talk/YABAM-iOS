import Foundation

public struct ReviewListDto: Decodable {
    public let reviewsContents: [ReviewInfoDto]
    public let totalCount: Int
    public let hasNextPage: Bool
    public let lastReviewId: Int

    public init(
        reviewsContents: [ReviewInfoDto],
        totalCount: Int,
        hasNextPage: Bool,
        lastReviewId: Int
    ) {
        self.reviewsContents = reviewsContents
        self.totalCount = totalCount
        self.hasNextPage = hasNextPage
        self.lastReviewId = lastReviewId
    }
}
