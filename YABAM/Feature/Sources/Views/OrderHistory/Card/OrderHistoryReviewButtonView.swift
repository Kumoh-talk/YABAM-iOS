import SwiftUI

struct OrderReviewButtonView: View {
    let canWriteReview: Bool
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            YBText(canWriteReview ? "리뷰쓰기" : "리뷰수정",
                   fontType: .boldBody1,
                   color: .Neutral.neutral900)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        .accessibilityLabel(canWriteReview ? "리뷰 작성하기" : "리뷰 수정하기")
    }
}
