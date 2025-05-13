import UIKit
import Core
import Feature
import Kingfisher

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        FeatureFontFamily.registerAllCustomFonts()
        
        configureKingfisherCacheLimit()
        
        return true
    }
    
    private func configureKingfisherCacheLimit() {
        let totalMemory = ProcessInfo.processInfo.physicalMemory
        let cacheLimit = totalMemory / 5
        
        ImageCache.default.memoryStorage.config.totalCostLimit = Int(cacheLimit)
        
        YBLogger.info("Kingfisher 캐시 제한 설정: \(cacheLimit / 1024 / 1024)MB")
    }
}
