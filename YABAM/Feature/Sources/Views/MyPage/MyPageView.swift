import SwiftUI

struct MyPageView: View {
    @State private var nickname: String = "사용자 닉네임"
    @State private var showEditNicknameSheet: Bool = false

    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                // MARK: - 프로필 영역
                VStack(spacing: 12) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(width: 80, height: 80)

                    YBText(nickname, fontType: .boldHeader4, color: .Neutral.neutral900)
                }
                .padding(.top, 40)

                // MARK: - 쿠폰 버튼
                VStack {
                    Button(action: {
                        // 쿠폰 액션
                    }) {
                        HStack {
                            YBText("쿠폰함", fontType: .mediumBody1, color: .Neutral.neutral900)
                            Spacer()
                            Image(systemName: "ticket")
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                    }
                }
                .padding(.horizontal)

                // MARK: - 메뉴 리스트
                VStack(spacing: 1) {
                    Group {
                        MyPageMenuItem(title: "닉네임 변경") {
                            showEditNicknameSheet = true
                        }
                        MyPageMenuItem(title: "개인정보처리방침") {}
                        MyPageMenuItem(title: "이용약관") {}
                    }

                    YBDivider().padding(.vertical, 8)

                    Group {
                        MyPageMenuItem(title: "로그아웃") {}
                        MyPageMenuItem(title: "회원탈퇴", color: .red) {}
                    }
                }
                .background(Color(.systemBackground))
                .cornerRadius(12)
                .padding(.horizontal)
            }
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 16)
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $showEditNicknameSheet) {
            EditNicknameView(nickname: $nickname)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("마이페이지", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
    }
}
