import SwiftUI

public struct YBLogoView: View {
    public init() {}

    public var body: some View {
        VStack(spacing: 16) {
            Image(.yabamWhiteLogo)
                .resizable()
                .frame(width: 140, height: 140)

            Image(.authYABAMText)
                .resizable()
                .scaledToFit()
                .frame(height: 60)
        }
    }
}
