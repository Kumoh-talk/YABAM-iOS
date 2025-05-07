import SwiftUI
import Core

struct OrderHistoryView: View {
    @State private var orders: [OrderHistory] = []
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(orders) { order in
                    OrderHistoryCardView(order: order)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo)
                    .resizable()
                    .frame(width: 24, height: 24)
                YBText("나의 주문내역", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
        .onAppear {
            orders = OrderHistorySampleData.orders
        }
    }
}
