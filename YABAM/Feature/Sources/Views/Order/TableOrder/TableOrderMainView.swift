import SwiftUI
import Core

struct TableOrderMainView: View {
    @State private var memberCount: Int = 2
    @State private var isExitAlertPresented = false
    @State private var showCallStaffPopup = false
    @State private var isNavigatingToMenuOrder = false
    @StateObject private var cartManager = CartManager()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(spacing: 0) {
                TableOrderHeaderView(memberCount: memberCount)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.Neutral.neutral400, lineWidth: 1)
                        .background(Color.white)
                    
                    MenuCartView(cartManager: cartManager)
                        .padding(12)
                }
                .padding(.horizontal, 20)
                .padding(.top, 18)
                .frame(height: 400)
                
                Button {
                    isNavigatingToMenuOrder = true
                } label: {
                    YBText("메뉴 추가", fontType: .boldBody2, color: .Neutral.neutral700)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.Neutral.neutral400, lineWidth: 1)
                        )
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
                
                Spacer()
                
                YBButton(
                    title: "\(cartManager.items.count)개 주문하기 - \(cartManager.totalPrice)원",
                    backgroundColor: cartManager.hasItems ? Color.Semantic.info : Color.Neutral.neutral200
                ) {
                    YBLogger.info("주문하기 버튼 클릭")
                }
            }
            
            if showCallStaffPopup {
                CallStaffPopup(showPopup: $showCallStaffPopup)
            }
        }
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig(image: Image(.close)) {
                isExitAlertPresented = true
            },
            trailing: NavigationButtonConfig(text: YBText("직원호출", fontType: .mediumBody2, color: .Neutral.neutral800)) {
                showCallStaffPopup = true
            }
        )
        .alert("지금 나가기를 누를 시 장바구니 정보가 사라집니다", isPresented: $isExitAlertPresented) {
            Button("나가기", role: .destructive) {
                dismiss()
            }
            Button("취소", role: .cancel) { }
        }
        .navigationDestination(isPresented: $isNavigatingToMenuOrder) {
            MenuOrderView(sections: SampleData.menuSections, cartManager: cartManager)
        }
    }
}
