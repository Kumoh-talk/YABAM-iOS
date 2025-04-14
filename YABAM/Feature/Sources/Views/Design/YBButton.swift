import SwiftUI

struct YBButton: View {
    let title: String
    let fontType: YBFont
    let textColor: Color
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let horizontalPadding: CGFloat
    let bottomPadding: CGFloat
    let isDisabled: Bool
    let action: () -> Void

    init(
        title: String,
        fontType: YBFont = .boldBody1,
        textColor: Color = .white,
        backgroundColor: Color = Color.Semantic.info,
        cornerRadius: CGFloat = 12,
        horizontalPadding: CGFloat = 16,
        bottomPadding: CGFloat = 12,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.fontType = fontType
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.horizontalPadding = horizontalPadding
        self.bottomPadding = bottomPadding
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            action()
        }) {
            YBText(title, fontType: fontType, color: textColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isDisabled ? backgroundColor.opacity(0.5) : backgroundColor)
                .cornerRadius(cornerRadius)
                .padding(.horizontal, horizontalPadding)
                .padding(.bottom, bottomPadding)
        }
        .disabled(isDisabled)
    }
}
