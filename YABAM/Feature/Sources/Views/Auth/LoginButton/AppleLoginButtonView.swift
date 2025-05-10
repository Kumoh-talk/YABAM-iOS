import SwiftUI
import Core
import AuthenticationServices

struct AppleLoginButtonView: View {
    var onLogin: (String, String) -> Void // (oauthId, idToken)

    var body: some View {
        SignInWithAppleButton(
            .signIn,
            onRequest: { request in
                request.requestedScopes = [.fullName, .email]
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    guard
                        let credential = authResults.credential as? ASAuthorizationAppleIDCredential,
                        let identityToken = credential.identityToken,
                        let idTokenString = String(data: identityToken, encoding: .utf8),
                        let userId = credential.user as String?
                    else { return }

                    onLogin(userId, idTokenString)

                case .failure(let error):
                    YBLogger.error("Apple Sign In failed: \(error.localizedDescription)")
                }
            }
        )
        .signInWithAppleButtonStyle(.white)
        .frame(height: 48)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 1, y: 3)
    }
}
