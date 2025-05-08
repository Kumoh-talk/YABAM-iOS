import SwiftUI

struct EditNicknameView: View {
    @Binding var nickname: String
    @State private var newNickname: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("새 닉네임을 입력하세요", text: $newNickname)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 32)
        .navigationTitle("닉네임 변경")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            },
            trailing: NavigationButtonConfig {
                YBText("저장", fontType: .boldBody1, color: newNickname.isEmpty ? .Neutral.neutral300 : .Neutral.neutral800)
            } action: {
                if !newNickname.isEmpty {
                    nickname = newNickname
                    dismiss()
                }
            }
        )
        .onAppear {
            newNickname = nickname
        }
    }
}
