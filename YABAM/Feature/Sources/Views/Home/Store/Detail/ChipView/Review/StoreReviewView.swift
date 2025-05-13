import SwiftUI

struct StoreReviewView: View {
    let storeReviewCount: Int
    @StateObject private var viewModel: StoreReviewViewModel
    @State private var showErrorAlert = false
    
    init(
        storeReviewCount: Int,
        viewModel: StoreReviewViewModel
    ) {
        self.storeReviewCount = storeReviewCount
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var reviews: [Review] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if reviews.isEmpty {
                YBText("리뷰가 없어요 🥲", fontType: .regularBody2, color: .Neutral.neutral500)
                    .padding()
            } else {
                YBText(
                    "\(storeReviewCount)개의 리뷰",
                    fontType: .boldHeader2,
                    color: .Neutral.neutral900
                )
                .padding(.horizontal)

                ForEach(viewModel.storeReviewList) { review in
                    ReviewRowView(review: review)
                    Divider()
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            
        }
    }
}
