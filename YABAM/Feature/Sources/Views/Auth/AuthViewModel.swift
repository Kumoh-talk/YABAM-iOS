import Core
import Combine
import Network

public final class AuthViewModel: ObservableObject {
    enum AuthState: Equatable {
        case idle
        case loading
        case authenticated
        case failure(String)
    }
    
    @Published var authState: AuthState = .idle
    private let authService: AuthServiceInterface
    
    init(authService: AuthServiceInterface) {
        self.authService = authService
    }
    
    @MainActor
    func handleKakaoLogin() async {
        authState = .loading
        
        do {
            try await authService.loginWithKakao()
            authState = .authenticated
        } catch let error as YBError {
            authState = .failure(error.displayFeedbackMessage)
        } catch {
            authState = .failure("예기치 않은 오류가 발생했어요.")
        }
    }
    
    @MainActor
    func handleAppleLogin(oauthId: String, idToken: String) {
        Task {
            authState = .loading

            do {
                try await authService.loginWithApple(oauthId: oauthId, idToken: idToken)
                authState = .authenticated
            } catch let error as YBError {
                authState = .failure(error.displayFeedbackMessage)
            } catch {
                authState = .failure("예기치 않은 오류가 발생했어요.")
            }
        }
    }
}
