import SwiftUI
import Network

public struct AuthView: View {
    @StateObject private var viewModel = AuthViewModel(authService: AuthService())
    @State private var navigateToHome = false
    @State private var showErrorAlert = false
    
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
                        .frame(width: 140, height: 140)

                    Image(.authYABAMText)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }

                Spacer()

                VStack(spacing: 16) {
                    KakaoLoginButtonView {
                        Task { await viewModel.handleKakaoLogin() }
                    }
                    .disabled(viewModel.authState == .loading)

                    AppleLoginButtonView { oauthId, idToken in
                        viewModel.handleAppleLogin(oauthId: oauthId, idToken: idToken)
                    }
                    .disabled(viewModel.authState == .loading)
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 60)
            }
        }
        .onChange(of: viewModel.authState) { state in
            switch state {
            case .authenticated:
                navigateToHome = true
            case .failure:
                showErrorAlert = true
            default:
                break
            }
        }
        .alert("로그인 실패", isPresented: $showErrorAlert) {
            Button("확인", role: .cancel) {}
        } message: {
            if case let .failure(message) = viewModel.authState {
                Text("\(message)")
            } else {
                Text("알 수 없는 오류")
            }
        }
    }
}
