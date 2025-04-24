import SwiftUI
import Core

struct OrderMenuView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @State private var isExitAlertPresented = false
    @State private var isNavigatingToOrder = false
    @State private var showCallStaffPopup = false
    @StateObject private var cartManager = CartManager()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MenuChipScrollView(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    onCallStaffTapped: {
                        showCallStaffPopup = true
                    }
                )
                
                MenuSectionList(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    cartManager: cartManager
                )
                
                Spacer()
                
                NavigationLink(destination: MenuOrderView(cartManager: cartManager), isActive: $isNavigatingToOrder) {
                    EmptyView()
                }

                YBButton(
                    title: "주문하기",
                    backgroundColor: cartManager.hasItems ? Color.Semantic.info : Color.Neutral.neutral200
                ) {
                    if cartManager.hasItems {
                        YBLogger.info("주문하기 버튼 클릭")
                        isNavigatingToOrder = true
                    }
                }
            }
            
            if showCallStaffPopup {
                CallStaffPopup(showPopup: $showCallStaffPopup)
            }
        }
        .navigationTitle("테이블 주문")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationButtons(
            leading: NavigationButtonConfig(image: Image(.close)) {
                isExitAlertPresented = true
            },
            trailing: NavigationButtonConfig(image: Image(.basket)) {
                YBLogger.debug("장바구니 버튼 클릭")
            }
        )
        .alert("지금 나가기를 누를 시 장바구니 정보가 사라집니다", isPresented: $isExitAlertPresented) {
            Button("나가기", role: .destructive) {
                dismiss()
            }
            Button("취소", role: .cancel) { }
        }
        .onAppear {
            if selectedSectionID == nil {
                selectedSectionID = sections.first?.id
            }
        }
    }
}
