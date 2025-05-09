import SwiftUI

struct ReviewRowView: View {
    let review: Review

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray.opacity(0.4))
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    YBText(review.userNickname, fontType: .boldBody1, color: .Neutral.neutral900)

                    Spacer()

                    HStack(spacing: 2) {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.system(size: 14))
                        YBText("\(review.rating)", fontType: .mediumBody2, color: .Neutral.neutral600)
                    }
                }

                YBText(
                    review.content,
                    fontType: .regularBody2,
                    color: .Neutral.neutral800
                )
                .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.vertical, 8)
    }
}
