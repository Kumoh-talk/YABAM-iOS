import SwiftUI

extension View {
    @ViewBuilder
    func withNavigationButtons(
        leading: NavigationButtonConfig? = nil,
        trailing: NavigationButtonConfig? = nil
    ) -> some View {
        self.toolbar {
            if let leading = leading {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: leading.action) {
                        leading.content
                    }
                }
            }

            if let trailing = trailing {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: trailing.action) {
                        trailing.content
                    }
                }
            }
        }
    }
}

struct NavigationButtonConfig {
    let content: AnyView
    let action: () -> Void

    init<Content: View>(@ViewBuilder content: () -> Content, action: @escaping () -> Void) {
        self.content = AnyView(content())
        self.action = action
    }
}
