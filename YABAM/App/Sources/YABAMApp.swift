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
            YBTabView()
        }
    }
    
    private func setupDependencyInjection() {
        /// Store Service
        DIContainer.shared.register(StoreServiceInterface.self, object: StoreService())
    }
}
