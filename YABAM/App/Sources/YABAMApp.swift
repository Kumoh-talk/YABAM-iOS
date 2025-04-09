import SwiftUI
import Feature

@main
struct YABAMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            YBTabView()
        }
    }
}
