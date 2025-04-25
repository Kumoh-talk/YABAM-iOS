import SwiftUI

extension View {
    func popGestureDisabled() -> some View {
        modifier(PopGestureDisabledViewModifier())
    }
}

struct PopGestureDisabledViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .task {
                PopGestureManager.shared.updatePopGestureState(isEnabled: false)
            }
            .onDisappear {
                PopGestureManager.shared.updatePopGestureState(isEnabled: true)
            }
    }
}
