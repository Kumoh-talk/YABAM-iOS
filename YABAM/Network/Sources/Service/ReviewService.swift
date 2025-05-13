public protocol ReviewServiceInterface {
    func createReview(review: ReviewRequestDTO) async throws
    func fetchReviewList(storeId: Int, lastReviewId: Int?, size: Int) async throws -> ReviewListDto
}

public final class ReviewService: ReviewServiceInterface {
    private let provider: YBProvider<ReviewAPI>
    
    public init(provider: YBProvider<ReviewAPI> = YBProvider<ReviewAPI>()) {
        self.provider = provider
    }
    
    public func createReview(review: ReviewRequestDTO) async throws {
        try await provider.requestDecodable(
            .createReview(dto: review),
            as: EmptyDecodable.self
        )
    }
    
    public func fetchReviewList(storeId: Int, lastReviewId: Int?, size: Int) async throws -> ReviewListDto {
        try await provider.requestDecodable(
            .fetchReviewList(storeId: storeId, lastReviewId: lastReviewId, size: size),
            as: ReviewListDto.self
        )
    }
}
