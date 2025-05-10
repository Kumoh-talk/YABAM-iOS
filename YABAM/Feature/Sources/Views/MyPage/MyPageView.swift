import SwiftUI

struct MyPageView: View {
    @State private var nickname: String = "사용자 닉네임"
    @State private var path: NavigationPath = NavigationPath()
    @State private var activePopup: MyPagePopupType?
    @State private var isPopupPresented = false
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                VStack(spacing: 32) {
                    ProfileSection(nickname: nickname)
                    
                    CouponButtonSection()
                    
                    MenuListSection(
                        onItemTap: { route in
                            path.append(route)
                        },
                        onActionTap: { popupType in
                            activePopup = popupType
                            isPopupPresented = true
                        }
                    )
                    
                    Spacer()
                }
                .padding(.bottom, 40)
                .padding(.horizontal, 16)
                
                if let popup = activePopup, isPopupPresented {
                    YBConfirmationPopup(
                        type: popup,
                        isPresented: $isPopupPresented,
                        onConfirm: {
                            handlePopupAction(popup)
                        }
                    )
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(for: MyPageRoute.self) { route in
                switch route {
                case .editNickname:
                    EditNicknameView(nickname: $nickname)
                case .privacyPolicy:
                    PrivacyPolicyView()
                case .termsOfService:
                    TermsOfServiceView()
                }
            }
            .withNavigationButtons(
                leading: NavigationButtonConfig(content: {
                    Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                    YBText("마이페이지", fontType: .mediumHeader5, color: .Neutral.neutral900)
                }, action: {})
            )
        }
    }
    
    private func handlePopupAction(_ popup: MyPagePopupType) {
        switch popup {
        case .logout:
            print("로그아웃 처리")
        case .withdraw:
            print("회원탈퇴 처리")
        }
    }
}
