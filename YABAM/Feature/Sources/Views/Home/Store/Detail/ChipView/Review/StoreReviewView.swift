import SwiftUI

struct StoreReviewView: View {
    let storeId: Int
    let storeReviewCount: Int
    @StateObject private var viewModel: StoreReviewViewModel
    @State private var showErrorAlert = false
    
    init(
        storeId: Int,
        storeReviewCount: Int,
        viewModel: StoreReviewViewModel
    ) {
        self.storeId = storeId
        self.storeReviewCount = storeReviewCount
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            if viewModel.storeReviewList.isEmpty {
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
                        .onAppear {
                        if review == viewModel.storeReviewList.last {
                            Task {
                                await viewModel.fetchNextPage()
                            }
                        }
                    }
                    Divider()
                }
                .padding(.horizontal)
            }
        }
        .onAppear {
            Task {
                viewModel.storeId = storeId
                await viewModel.fetchInitialReviews()
            }
        }
        .alert(isPresented: $showErrorAlert) {
            Alert(
                title: Text("리뷰 조회 실패"),
                message: Text("리뷰 정보를 불러오지 못했어요."),
                dismissButton: .default(Text("확인"))
            )
        }
    }
}
