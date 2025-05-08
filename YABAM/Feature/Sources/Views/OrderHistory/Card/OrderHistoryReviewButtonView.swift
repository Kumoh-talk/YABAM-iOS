import SwiftUI

struct OrderReviewButtonView: View {
    let canWriteReview: Bool
    let onTap: () -> Void
    
    var body: some View {
        if canWriteReview {
            Button(action: onTap) {
                YBText("리뷰 작성하기", fontType: .boldBody1, color: .white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.Semantic.info)
                    .cornerRadius(10)
            }
        } else {
            YBText("리뷰 작성완료", fontType: .boldBody1, color: .Neutral.neutral800)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}
