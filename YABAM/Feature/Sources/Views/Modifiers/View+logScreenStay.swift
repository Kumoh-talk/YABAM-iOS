import SwiftUI
import FirebaseAnalytics

extension View {
    func logScreenStay(screen: YBScreen) -> some View {
        self.modifier(ScreenStayLogger(screen: screen))
    }
}

enum YBScreen: String {
    case splash
    case auth
    case home
    case storeList
    case storeDetail
    case orderQRCode
    case menuOrder
    case menuDetail
    case cart
    case reviewWrite
    case orderHistory
    case myPage
}

struct ScreenStayLogger: ViewModifier {
    let screen: YBScreen
    @State private var enterDate: Date?

    func body(content: Content) -> some View {
        content
            .onAppear {
                enterDate = Date()
                Analytics.logEvent("screen_view", parameters: [
                    "screen_name": screen.rawValue
                ])
            }
            .onDisappear {
                if let enterDate {
                    let duration = Date().timeIntervalSince(enterDate)
                    Analytics.logEvent("screen_stay_duration", parameters: [
                        "screen_name": screen.rawValue,
                        "duration_sec": duration
                    ])
                }
            }
    }
}
