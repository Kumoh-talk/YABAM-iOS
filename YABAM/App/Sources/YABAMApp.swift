import SwiftUI
import Core
import Feature
import YBData
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
        let authRepository = AuthRepository(service: authService)
        DIContainer.shared.register(AuthRepositoryInterface.self, object: authRepository)
        
        /// Store Service
        let storeService = StoreService()
        DIContainer.shared.register(StoreServiceInterface.self, object: storeService)
        let storeRepository = StoreRepository(service: storeService)
        DIContainer.shared.register(StoreRepositoryInterface.self, object: storeRepository)
    }
}
