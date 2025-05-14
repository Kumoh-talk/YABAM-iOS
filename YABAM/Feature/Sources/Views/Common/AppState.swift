import Combine
import Core
import Foundation

final class AppState: ObservableObject {
    @Published var isAuthenticated: Bool? = nil

    init() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleTokenExpired),
            name: .userRefreshTokenExpired,
            object: nil
        )
    }

    @objc
    private func handleTokenExpired() {
        Task { @MainActor in
            self.isAuthenticated = false
        }
    }
}
