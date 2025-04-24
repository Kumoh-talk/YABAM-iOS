import SwiftUI
import Core

struct MenuOrderView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @ObservedObject var cartManager: CartManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MenuChipScrollView(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    onCallStaffTapped: {
                        
                    }
                )
                
                MenuSectionList(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    cartManager: cartManager
                )
                
                Spacer()

                YBButton(
                    title: "메뉴 담기",
                    backgroundColor: cartManager.hasItems ? Color.Semantic.info : Color.Neutral.neutral200
                ) {
                    if cartManager.hasItems {
                        YBLogger.info("주문하기 버튼 클릭")
                    }
                }
            }
            
        }
        .navigationTitle("메뉴 주문하기")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationButtons(
            leading: NavigationButtonConfig(image: Image(.popArrow)) {
                dismiss()
            }
        )
        .onAppear {
            if selectedSectionID == nil {
                selectedSectionID = sections.first?.id
            }
        }
    }
}
