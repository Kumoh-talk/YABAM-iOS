import Core
import Combine
import Network

final class StoreReviewViewModel: ObservableObject {
    enum StoreReviewState: Equatable {
        case idle
        case loading
        case fetchedStoreReview
        case failure(String)
    }
    
    @Published var state: StoreReviewState = .idle
    @Published var storeReviewList: [Review] = []
    private let service: ReviewServiceInterface
    
    init(service: ReviewServiceInterface) {
        self.service = service
    }
    
    @MainActor
    func fetchReviewList(storeId: Int, lastReviewId: Int?, size: Int) async {
        do {
            let reviewListDto = try await service.fetchReviewList(
                storeId: storeId,
                lastReviewId: lastReviewId,
                size: size
            )
            storeReviewList = reviewListDto.reviewsContents.map { Review(from: $0) }
            state = .fetchedStoreReview
        } catch {
            YBLogger.debug("리뷰 정보를 불러오는 데 실패했습니다: \(error.localizedDescription)")
            
        }
    }
}
