import UIKit
import Feature
import FirebaseCore

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {        
        FeatureFontFamily.registerAllCustomFonts()
        FirebaseApp.configure()
        
        return true
    }
}
