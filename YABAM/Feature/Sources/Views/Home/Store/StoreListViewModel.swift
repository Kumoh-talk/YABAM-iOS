import Core
import Combine
import Network

final class StoreListViewModel: ObservableObject {
    enum StoreListState: Equatable {
        case idle
        case loading
        case storeListLoaded
        case failure(String)
    }
    
    @Published var state: StoreListState = .idle
    @Published var storeList: StoreList = .empty
    private let service: StoreServiceInterface
    
    init(service: StoreServiceInterface) {
        self.service = service
    }
    @MainActor
    func fetchInitialStoreList() async {
        do {
            let storeListDto = try await service.fetchStoreList(lastReviewCount: nil, lastStoreId: nil, size: 20)
            self.storeList = StoreList(storeListDto: storeListDto)
            state = .storeListLoaded
        } catch {
            state = .failure("가게 정보를 불러오는 데 실패했습니다.")
        }
    }

    @MainActor
    func fetchNextPage() async throws {
        state = .loading
        
        do {
            let storeListDto = try await service.fetchStoreList(
                lastReviewCount: storeList.lastReviewCount,
                lastStoreId: storeList.lastStoreId,
                size: 20
            )
            self.storeList = StoreList(storeListDto: storeListDto)
            state = .storeListLoaded
        } catch {
            state = .failure("가게 정보를 불러오는 데 실패했습니다.")
        }
    }
}
