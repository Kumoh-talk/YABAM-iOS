import SwiftUI

struct MyPageMenuItem: View {
    let title: String
    var color: Color = .Neutral.neutral900
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                YBText(title, fontType: .mediumBody1, color: color)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
        }
    }
}
