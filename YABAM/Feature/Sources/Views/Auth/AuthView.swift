import SwiftUI

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
                        .frame(width: 140, height: 140)
                        .colorMultiply(.white)

                    Image(.authYABAMText)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 60)
                }

                Spacer()

                VStack(spacing: 16) {
                    KakaoLoginButtonView {
                        // 카카오 로그인 액션
                    }

                    AppleLoginButtonView()
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 60)
            }
        }
    }
}
