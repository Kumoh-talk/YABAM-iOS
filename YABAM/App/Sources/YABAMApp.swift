import SwiftUI
import Core
import Feature
import Network

@main
struct YABAMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        setupDependencyInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
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
