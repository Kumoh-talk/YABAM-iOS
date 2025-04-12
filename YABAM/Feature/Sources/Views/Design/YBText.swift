import SwiftUI

struct YBText: View {
    let title: String
    let fontType: YBFont
    let color: Color

    init(
        _ title: String,
        fontType: YBFont,
        color: Color
    ) {
        self.title = title
        self.fontType = fontType
        self.color = color
    }

    var body: some View {
        Text(title)
            .applyFont(font: fontType)
            .foregroundStyle(color)
    }
}
