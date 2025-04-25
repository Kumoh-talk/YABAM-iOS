import SwiftUI
import Core

struct MenuOrderView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @State private var showExitAlert = false
    @ObservedObject var cartManager: CartManager
    @StateObject private var temporaryCart = CartManager()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MenuChipScrollView(
                    sections: sections,
                    selectedSectionID: $selectedSectionID
                )
                
                MenuSectionList(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    cartManager: temporaryCart
                )
                
                Spacer()
                
                YBButton(
                    title: "\(temporaryCart.items.count)개 메뉴 담기",
                    backgroundColor: temporaryCart.hasItems ? Color.Semantic.info : Color.Neutral.neutral200,
                    isDisabled: !temporaryCart.hasItems
                ) {
                    if temporaryCart.hasItems {
                        cartManager.merge(temporaryCart.items)
                        temporaryCart.clear()
                        YBLogger.info("주문하기 버튼 클릭")
                        dismiss()
                    }
                }
            }
        }
        .navigationTitle("메뉴 주문하기")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationButtons(
            leading: NavigationButtonConfig(image: Image(.close)) {
                if temporaryCart.hasItems {
                    showExitAlert = true
                } else {
                    dismiss()
                }
            }
        )
        .alert("메뉴가 저장되지 않고 사라집니다. 나가시겠어요?", isPresented: $showExitAlert) {
            Button("나가기", role: .destructive) {
                dismiss()
            }
            Button("취소", role: .cancel) {}
        }
        .onAppear {
            if selectedSectionID == nil {
                selectedSectionID = sections.first?.id
            }
        }
    }
}
