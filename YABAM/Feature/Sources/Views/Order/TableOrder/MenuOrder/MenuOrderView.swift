import SwiftUI
import Core

struct MenuOrderView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @State private var isExitAlert = false
    @ObservedObject var cartManager: CartManager
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                MenuChipScrollView(
                    sections: sections,
                    selectedSectionID: $selectedSectionID
                )
                .padding(.top, 2)
                
                MenuSectionList(
                    sections: sections,
                    selectedSectionID: $selectedSectionID,
                    cartManager: cartManager
                )
                .frame(maxHeight: .infinity)
            }
        }
        .navigationTitle("메뉴 주문하기")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            }
        )
        .alert("메뉴가 저장되지 않고 사라집니다. 나가시겠어요?", isPresented: $isExitAlert) {
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
