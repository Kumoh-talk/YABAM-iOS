import SwiftUI
import Core

struct MenuCartView: View {
    @State private var memberCount: Int = 2
    @State private var isCallStaffPopup = false
    @ObservedObject var cartManager: CartManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                MenuCartHeaderView(memberCount: memberCount)
                
                MenuCartScrollView(isTemporary: false, cartManager: cartManager)
                    .padding(12)
                    .padding(.top, 18)
                
                Spacer()
                
                YBButton(
                    title: "\(cartManager.items.count)개 주문하기 - \(cartManager.totalPrice)원",
                    backgroundColor: cartManager.hasItems ? Color.Semantic.info : Color.Neutral.neutral200,
                    isDisabled: !cartManager.hasItems
                ) {
                    YBLogger.info("주문하기 버튼 클릭")
                }
            }
            
            if isCallStaffPopup {
                CallStaffPopup(showPopup: $isCallStaffPopup)
            }
        }
        .navigationBarBackButtonHidden()
        .task {
            PopGestureManager.shared.updatePopGestureState(isEnabled: false)
        }
        .onDisappear {
            PopGestureManager.shared.updatePopGestureState(isEnabled: true)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            },
            
            trailing: NavigationButtonConfig {
                YBText("직원호출", fontType: .mediumBody2, color: .Neutral.neutral800)
            } action: {
                isCallStaffPopup = true
            }
        )
    }
}
