import Core
import Combine
import Network

final class MyPageViewModel: ObservableObject {
    enum MyPageState: Equatable {
        case idle
        case loading
        case fetchedUserInfo
        case failure(String)
    }
    
    @Published private(set) var state: MyPageState = .idle
    @Published private(set) var userNickname: String?
    private let service: AuthServiceInterface
    
    init(service: AuthServiceInterface) {
        self.service = service
    }
    
    @MainActor
    func fetchUserInfo() async {
        do {
            let userInfo = try await service.fetchUserInfo()
            self.userNickname = userInfo.userNickname
            YBLogger.debug("User Info: \(userInfo)")
            state = .fetchedUserInfo
        } catch {
            YBLogger.debug("Failed to fetch user info: \(error)")
            state = .failure("Failed to fetch user info.")
        }
    }
}
