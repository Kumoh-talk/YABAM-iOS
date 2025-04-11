import SwiftUI

struct YBFontModifier: ViewModifier {
    let font: YBFont

    init(font: YBFont) {
        self.font = font
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(font.name, size: font.size))
            .lineSpacing(0)
            .padding(.vertical, font.size * 0.135)
    }
}

extension View {
    func applyFont(font: YBFont) -> some View {
        modifier(YBFontModifier(font: font))
    }
}
