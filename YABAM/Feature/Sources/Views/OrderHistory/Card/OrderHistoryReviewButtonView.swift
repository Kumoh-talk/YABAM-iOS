import SwiftUI

struct OrderReviewButtonView: View {
    let canWriteReview: Bool
    let onTap: () -> Void

    var body: some View {
        if canWriteReview {
            Button(action: onTap) {
                YBText("리뷰쓰기", fontType: .boldBody1, color: .Neutral.neutral900)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        } else {
            Button(action: onTap) {
                YBText("리뷰수정", fontType: .boldBody1, color: .Neutral.neutral900)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
    }
}
