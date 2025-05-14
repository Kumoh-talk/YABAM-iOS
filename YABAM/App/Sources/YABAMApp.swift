import SwiftUI
import Core
import Feature
import Network
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct YABAMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var deepLinkManager = DeepLinkManager()
    
    init() {
        if let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as? String {
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        }
        setupDependencyInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.light)
                .environmentObject(deepLinkManager)
                .onOpenURL(perform: { url in
                    deepLinkManager.handleDeepLink(url: url)
                    if AuthApi.isKakaoTalkLoginUrl(url) {
                        _ = AuthController.handleOpenUrl(url: url)
                    }
                })
        }
    }
    
    private func setupDependencyInjection() {
        /// Auth Service
        let authService = AuthService()
        DIContainer.shared.register(AuthServiceInterface.self, object: authService)
        
        /// Store Service
        let storeService = StoreService()
        DIContainer.shared.register(StoreServiceInterface.self, object: storeService)
        
        /// Review Service
        let reviewService = ReviewService()
        DIContainer.shared.register(ReviewServiceInterface.self, object: reviewService)
        
        /// Cart Service
        let cartService = CartService()
        DIContainer.shared.register(CartServiceInterface.self, object: cartService)
        
        /// Order Service
        let orderService = OrderService()
        DIContainer.shared.register(OrderServiceInterface.self, object: orderService)
        
        /// Receipt Service
        let receiptService = ReceiptService()
        DIContainer.shared.register(ReceiptServiceInterface.self, object: receiptService)
    }
}
