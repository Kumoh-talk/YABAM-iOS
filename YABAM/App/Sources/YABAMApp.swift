import SwiftUI
import Core
import Feature
import Network
import KakaoSDKAuth
import KakaoSDKCommon

@main
struct YABAMApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {        
        if let kakaoAppKey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] as? String {
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        }
        setupDependencyInjection()
    }
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            })
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
