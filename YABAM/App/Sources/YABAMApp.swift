import SwiftUI
import Core
import Feature
import Network
import KakaoSDKAuth

@main
struct YABAMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        setupDependencyInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .onOpenURL { url in
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                }
        }
    }
    
    private func setupDependencyInjection() {
        /// Auth
        let authService = AuthService()
        DIContainer.shared.register(AuthServiceInterface.self, object: authService)
        
        /// Store Service
        let storeService = StoreService()
        DIContainer.shared.register(StoreServiceInterface.self, object: storeService)
    }
}
