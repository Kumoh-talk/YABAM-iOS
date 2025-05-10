import Network
import Core

public enum AuthViewModelFactory {
    public static func make() -> AuthViewModel {
        let service = try! DIContainer.shared.resolve(AuthServiceInterface.self)
        return AuthViewModel(authService: service)
    }
}
