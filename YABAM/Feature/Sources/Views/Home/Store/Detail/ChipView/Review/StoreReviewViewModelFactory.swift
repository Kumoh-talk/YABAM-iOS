import Network
import Core

enum StoreReviewViewModelFactory: Error {
    static func make() -> StoreReviewViewModel {
        guard let service = try? DIContainer.shared.resolve(ReviewServiceInterface.self) else {
            YBLogger.error("ReviewServiceInterface 의존성 주입 실패")
            fatalError("ReviewServiceInterface 의존성 주입 실패")
        }
        return StoreReviewViewModel(service: service)
    }
}
