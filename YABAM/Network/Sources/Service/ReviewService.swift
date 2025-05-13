public protocol ReviewServiceInterface {
    
}

public final class ReviewService: ReviewServiceInterface {
    private let provider: YBProvider<ReviewAPI>
    
    public init(provider: YBProvider<ReviewAPI> = YBProvider<ReviewAPI>()) {
        self.provider = provider
    }
}
