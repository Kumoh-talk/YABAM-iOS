import SwiftUI

struct KakaoLoginButtonView: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(.kakaoLogin)
                    .resizable()
                    .frame(width: 14, height: 14)
                YBText("카카오 로그인", fontType: .mediumHeader5, color: .black)
            }
            .frame(maxWidth: .infinity, minHeight: 48)
            .foregroundColor(.black)
            .background(Color.Semantic.yellow)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 3)
        }
    }
}
