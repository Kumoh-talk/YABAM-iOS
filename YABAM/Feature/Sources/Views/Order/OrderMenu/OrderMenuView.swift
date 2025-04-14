import SwiftUI

struct OrderMenuView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @State private var isExitAlertPresented = false
    @State private var showCallStaffPopup = false
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
                    selectedSectionID: $selectedSectionID
                )
            }
            
            if showCallStaffPopup {
                CallStaffPopup(showPopup: $showCallStaffPopup)
            }
        }
        .navigationTitle("테이블 주문")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .withNavigationButtons(
            leading: NavigationButtonConfig(systemName: "chevron.left") {
                isExitAlertPresented = true
            },
            trailing: NavigationButtonConfig(systemName: "cart") {
                print("장바구니 눌림")
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
