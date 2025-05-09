import SwiftUI
import AuthenticationServices

public struct AuthView: View {
    public init() { }

    public var body: some View {
        ZStack {
            Image(.authBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.1)
                .ignoresSafeArea()

            VStack {
                Spacer()

                VStack(spacing: 16) {
                    Image(.yabamWhiteLogo)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .colorMultiply(.white)

                    Image(.authYABAMText)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }

                Spacer()

                VStack(spacing: 12) {
                    Button(action: {
                        // 카카오 로그인 액션
                    }) {
                        HStack(spacing: 8) {
                            Image(.kakaoLogin)
                                .resizable()
                                .frame(width: 14, height: 14)
                            YBText("카카오 로그인", fontType: .mediumHeader5, color: .black)
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, minHeight: 48)
                        .foregroundColor(.black)
                        .background(Color.Semantic.yellow)
                        .cornerRadius(10)
                    }

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
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
            }
        }
    }
}
