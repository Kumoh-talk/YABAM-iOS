import SwiftUI

struct YBBadge: View {
    let title: String
    let fontType: YBFont
    let color: Color
    
    init(
        _ title: String,
        fontType: YBFont = .boldBody3,
        color: Color = .Neutral.neutral700
    ) {
        self.title = title
        self.fontType = fontType
        self.color = color
    }
    
    var body: some View {
        YBText(title, fontType: fontType, color: color)
            .padding(4)
            .background(Color.Neutral.neutral100)
            .cornerRadius(4)
    }
}

