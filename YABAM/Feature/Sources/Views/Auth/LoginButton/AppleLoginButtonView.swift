import SwiftUI
import AuthenticationServices

struct AppleLoginButtonView: View {
    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                // 로그인 처리
            }
        )
        .signInWithAppleButtonStyle(.white)
        .frame(height: 48)
        .cornerRadius(10)
    }
}
