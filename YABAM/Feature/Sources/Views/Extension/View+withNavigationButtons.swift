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
                        leading.image
                    }
                }
            }

            if let trailing = trailing {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: trailing.action) {
                        trailing.image
                    }
                }
            }
        }
    }
}

struct NavigationButtonConfig {
    let image: Image
    let action: () -> Void
    
    init(systemName: String, action: @escaping () -> Void) {
        self.image = Image(systemName: systemName)
        self.action = action
    }
    
    init(image: Image, action: @escaping () -> Void) {
        self.image = image
        self.action = action
    }
}
