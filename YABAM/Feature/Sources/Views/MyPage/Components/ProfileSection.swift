import SwiftUI

struct ProfileSection: View {
    let nickname: String

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(.gray.opacity(0.6))
                .frame(width: 80, height: 80)

            YBText(nickname, fontType: .boldHeader4, color: .Neutral.neutral900)
        }
        .padding(.top, 40)
    }
}
