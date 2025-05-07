import SwiftUI

struct OrderHistoryCardView: View {
    let order: OrderHistory
    @State private var showReviewSheet = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            OrderHistoryHeaderView(date: order.orderDate) {
                // 주문 상세 이동
            }
            
            OrderHistoryStoreSummaryView(
                imageName: .yabamFillLogo,
                storeName: order.storeName,
                menuSummary: "\(order.orderedMenus.first?.name ?? "") 외 \(order.totalMenuCount)개 \(order.totalPrice)원"
            )
            
            OrderReviewButtonView(
                canWriteReview: order.canWriteReview,
                onTap: {
                    showReviewSheet = true
                }
            )
            .sheet(isPresented: $showReviewSheet) {
                ReviewWriteView(isPresented: $showReviewSheet) { rating, content in
                    print("저장된 리뷰 - 별점: \(rating), 내용: \(content)")
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 2)
    }
}
