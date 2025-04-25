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
                        if let image = leading.image {
                            image
                        } else if let text = leading.text {
                            text
                        }
                    }
                }
            }

            if let trailing = trailing {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: trailing.action) {
                        if let image = trailing.image {
                            image
                        } else if let text = trailing.text {
                            text
                        }
                    }
                }
            }
        }
    }
}

struct NavigationButtonConfig {
    let image: Image?
    let text: YBText?
    let action: () -> Void

    init(image: Image, action: @escaping () -> Void) {
        self.image = image
        self.text = nil
        self.action = action
    }
    
    init(text: YBText, action: @escaping () -> Void) {
        self.image = nil
        self.text = text
        self.action = action
    }
}
