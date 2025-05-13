import Network
import Core

enum StoreListViewModelFactory {
    static func make() -> StoreListViewModel {
        guard let service = try? DIContainer.shared.resolve(StoreServiceInterface.self) else {
            YBLogger.error("StoreServiceInterface 의존성 주입 실패")
            fatalError("StoreServiceInterface 의존성 주입 실패")
        }
        return StoreListViewModel(service: service)
    }
}
