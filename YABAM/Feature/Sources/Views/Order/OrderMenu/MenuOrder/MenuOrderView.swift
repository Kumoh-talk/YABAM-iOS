import SwiftUI
import Core

struct MenuOrderView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var cartManager: CartManager
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(cartManager.items) { item in
                            MenuItemView(item: item)
                                .padding(.horizontal, 16)
                        }
                    }
                }
                
                Spacer()
                
                YBButton(
                    title: "\(cartManager.items.count)개 주문하기 - \(cartManager.totalPrice)원",
                    backgroundColor: cartManager.hasItems ? Color.Semantic.info : Color.Neutral.neutral200
                ) {
                    YBLogger.info("주문하기 버튼 클릭")
                }
            }
        }
        .navigationTitle("주문 목록")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.large)
        .withNavigationButtons(
            leading: NavigationButtonConfig(
                image: Image(.popArrow),
                action: { dismiss() }
            )
        )
    }
}
