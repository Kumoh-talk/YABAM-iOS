import SwiftUI

struct MyPageView: View {
    @State private var nickname: String = "사용자 닉네임"
    @State private var path: NavigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 32) {
                    ProfileSection(nickname: nickname)

                    CouponButtonSection()

                    MenuListSection { route in
                        path.append(route)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 16)
            .navigationBarBackButtonHidden()
            .navigationDestination(for: MyPageRoute.self) { route in
                switch route {
                case .editNickname:
                    EditNicknameView(nickname: $nickname)
                case .privacyPolicy:
                    EmptyView()
                case .termsOfService:
                    EmptyView()
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
}
