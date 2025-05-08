import SwiftUI

struct MenuListSection: View {
    var onItemTap: (MyPageRoute) -> Void

    var body: some View {
        VStack(spacing: 1) {
            Group {
                MyPageMenuItem(title: "닉네임 변경", isNavigable: true) {
                    onItemTap(.editNickname)
                }
                MyPageMenuItem(title: "개인정보처리방침", isNavigable: true) {
                    onItemTap(.privacyPolicy)
                }
                MyPageMenuItem(title: "이용약관", isNavigable: true) {
                    onItemTap(.termsOfService)
                }
            }

            YBDivider().padding(.vertical, 8)

            Group {
                MyPageMenuItem(
                    title: "로그아웃",
                    isNavigable: false,
                    color: .Neutral.neutral800,
                    action: { }
                )
                MyPageMenuItem(
                    title: "회원탈퇴",
                    isNavigable: false,
                    color: .Neutral.neutral600,
                    action: { }
                )
            }
        }
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}
