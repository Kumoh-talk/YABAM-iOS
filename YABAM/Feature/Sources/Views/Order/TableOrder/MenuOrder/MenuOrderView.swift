import SwiftUI
import Core

struct MenuOrderView: View {
    let sections: [MenuSection]
    @State private var selectedSectionID: String?
    @State private var isExitAlert = false
    @State private var isNavigatingToCart = false
    @State private var isCallStaffPopup = false
    @StateObject private var cartManager = CartManager()
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
                    isNavigationEnabled: true,
                    selectedSectionID: $selectedSectionID,
                    cartManager: cartManager
                )
                .frame(maxHeight: .infinity)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        isNavigatingToCart = true
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.Semantic.info)
                                .frame(width: 60, height: 60)
                                .shadow(radius: 4)
                            
                            Image(systemName: "cart")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                            
                            if cartManager.hasItems {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .offset(x: 13, y: -13)
                            }
                        }
                    }
                    .padding(.bottom, 24)
                    .padding(.trailing, 24)
                }
            }
            
            if isCallStaffPopup {
                CallStaffPopup(showPopup: $isCallStaffPopup)
            }
        }
        .navigationTitle("메뉴 주문하기")
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .popGestureDisabled()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.close)
            } action: {
                isExitAlert = true
            },
            
            trailing: NavigationButtonConfig {
                YBText("직원호출", fontType: .mediumBody2, color: .Neutral.neutral800)
            } action: {
                isCallStaffPopup = true
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
        .navigationDestination(isPresented: $isNavigatingToCart) {
            MenuCartView(cartManager: cartManager)
        }
    }
}
