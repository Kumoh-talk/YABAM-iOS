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
    
    @Published private(set) var state: StoreListState = .idle
    @Published private(set) var storeList: StoreList = .empty
    @Published private(set) var isFetchingNextPage: Bool = false
    @Published private(set) var errorMessage: String?
    private let service: StoreServiceInterface
    
    init(service: StoreServiceInterface) {
        self.service = service
    }
    
    @MainActor
    func fetchInitialStoreList() async {
        do {
            let storeListDto = try await service.fetchStoreList(
                lastReviewCount: nil,
                lastStoreId: nil,
                size: 20
            )
            self.storeList = StoreList(storeListDto: storeListDto)
            state = .storeListLoaded
            errorMessage = nil
        } catch {
            YBLogger.debug("가게 정보를 불러오는 데 실패했습니다: \(error)")
            errorMessage = "가게 정보를 불러오는 데 실패했습니다."
            state = .failure("가게 정보를 불러오는 데 실패했습니다.")
        }
    }
    
    @MainActor
    func fetchNextPage() async {
        guard storeList.hasNextPage,
              state != .loading,
              !isFetchingNextPage else { return }
        
        isFetchingNextPage = true
        state = .loading
        
        do {
            let nextListDto = try await service.fetchStoreList(
                lastReviewCount: storeList.lastReviewCount,
                lastStoreId: storeList.lastStoreId,
                size: 20
            )
            let newList = StoreList(storeListDto: nextListDto)
            storeList = storeList.appending(contentsOf: newList)
            state = .storeListLoaded
            errorMessage = nil
        } catch {
            YBLogger.debug("다음 페이지를 불러오는 데 실패했습니다: \(error)")
            errorMessage = "다음 페이지를 불러오는 데 실패했습니다."
            state = .failure("다음 페이지를 불러오는 데 실패했습니다.")
        }
        
        isFetchingNextPage = false
    }
}
