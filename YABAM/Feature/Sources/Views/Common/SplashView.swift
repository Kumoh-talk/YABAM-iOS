import SwiftUI

public struct SplashView: View {
    public init() {}

    public var body: some View {
        ZStack {
            Image(.authBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.1)
                .ignoresSafeArea()

            YBLogoView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
