import Core
import Combine
import Network

final class StoreReviewViewModel: ObservableObject {
    enum StoreReviewState: Equatable {
        case idle
        case loading
        case storeReviewLoaded
        case failure(String)
    }
    
    @Published private(set) var state: StoreReviewState = .idle
    @Published private(set) var storeReviewList: [Review] = []
    @Published private(set) var isFetchingNextPage: Bool = false
    @Published private(set) var errorMessage: String?

    private let service: ReviewServiceInterface
    private var hasNextPage: Bool = true
    private var lastReviewId: Int? = nil
    var storeId: Int = -1
    
    init(service: ReviewServiceInterface) {
        self.service = service
    }
    
    @MainActor
    func fetchInitialReviews(size: Int = 10) async {
        guard state != .loading else { return }
        
        state = .loading
        lastReviewId = nil

        do {
            let dto = try await service.fetchReviewList(storeId: storeId, lastReviewId: nil, size: size)
            storeReviewList = dto.reviewsContents.map { Review(from: $0) }
            hasNextPage = dto.hasNextPage
            lastReviewId = dto.lastReviewId
            state = .storeReviewLoaded
            errorMessage = nil
        } catch {
            YBLogger.debug("리뷰 초기 로딩 실패: \(error)")
            errorMessage = "리뷰를 불러오는 데 실패했습니다."
            state = .failure(errorMessage ?? "")
        }
    }
    
    @MainActor
    func fetchNextPage(size: Int = 10) async {
        guard hasNextPage,
              !isFetchingNextPage,
              state != .loading else { return }

        isFetchingNextPage = true

        do {
            let dto = try await service.fetchReviewList(storeId: storeId, lastReviewId: lastReviewId, size: size)
            let newReviews = dto.reviewsContents.map { Review(from: $0) }
            storeReviewList += newReviews
            hasNextPage = dto.hasNextPage
            lastReviewId = dto.lastReviewId
            state = .storeReviewLoaded
            errorMessage = nil
        } catch {
            YBLogger.debug("리뷰 다음 페이지 로딩 실패: \(error)")
            errorMessage = "리뷰 더 불러오는 데 실패했습니다."
            state = .failure(errorMessage ?? "")
        }

        isFetchingNextPage = false
    }
}
