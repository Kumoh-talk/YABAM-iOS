import SwiftUI
import Core

public struct RootView: View {
    @StateObject private var appState = AppState()

    public init() {}

    public var body: some View {
        Group {
            if appState.isAuthenticated == nil {
                SplashView()
            } else if appState.isAuthenticated == true {
                YBTabView()
            } else {
                AuthView(
                    viewModel: AuthViewModelFactory.make(),
                    isAuthenticated: Binding(
                        get: { appState.isAuthenticated ?? false },
                        set: { appState.isAuthenticated = $0 }
                    )
                )
            }
        }
        .task {
            do {
                try await YBTokenManager.shared.loadTokenFromKC()
                appState.isAuthenticated = true
            } catch {
                YBLogger.error("토큰 로딩 실패: \(error.localizedDescription)")
                appState.isAuthenticated = false
            }
        }
    }
}
