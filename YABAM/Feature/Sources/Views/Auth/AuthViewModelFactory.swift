import Network
import Core

enum AuthViewModelFactory {
    static func make() -> AuthViewModel {
        let service = try! DIContainer.shared.resolve(AuthServiceInterface.self)
        return AuthViewModel(authService: service)
    }
}
