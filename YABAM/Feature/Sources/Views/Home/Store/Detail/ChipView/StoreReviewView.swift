import SwiftUI

struct StoreReviewView: View {
    let store: Store

    @State private var reviews: [Review] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if reviews.isEmpty {
                YBText("리뷰를 불러오는 중...", fontType: .regularBody2, color: .Neutral.neutral500)
                    .padding()
            } else {
                YBText("\(store.reviewCount)개의 리뷰", fontType: .boldHeader2, color: .Neutral.neutral800)
                    .padding(.horizontal)

                ForEach(reviews) { review in
                    ReviewRowView(review: review)
                    Divider()
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            reviews = ReviewSampleData.reviews
        }
    }
}
