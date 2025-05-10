import SwiftUI
import Core

public struct RootView: View {
    @State private var isAuthenticated: Bool? = nil
    
    public init() {}

    public var body: some View {
        Group {
            if isAuthenticated == nil {
                SplashView()
            } else if isAuthenticated == true {
                YBTabView()
            } else {
                AuthView(viewModel: AuthViewModelFactory.make())
            }
        }
        .task {
            do {
                try await YBTokenManager.shared.loadTokenFromKC()
                isAuthenticated = true
            } catch {
                YBLogger.error("토큰 로딩 실패: \(error.localizedDescription)")
                isAuthenticated = false
            }
        }
    }
}
