import Network
import Core

enum MyPageViewModelFactory {
    static func make() -> MyPageViewModel {
        guard let service = try? DIContainer.shared.resolve(AuthServiceInterface.self) else {
            YBLogger.error("AuthService 의존성 주입 실패")
            fatalError("AuthService 의존성 주입 실패")
        }
        return MyPageViewModel(service: service)
    }
}
