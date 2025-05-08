import SwiftUI

struct MyPageMenuItem: View {
    let title: String
    let isNavigable: Bool
    var color: Color = .Neutral.neutral900
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                let fontType: YBFont = isNavigable ? .mediumBody1 : .mediumBody2
                YBText(title, fontType: fontType, color: color)
                
                Spacer()
                
                if isNavigable {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.Neutral.neutral500)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
