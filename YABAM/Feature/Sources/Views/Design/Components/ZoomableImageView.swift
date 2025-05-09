import SwiftUI

struct ZoomableImageView: View {
    let imageName: String
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 1.0

    var body: some View {
        Image(.yabamFillLogo) // TODO: imageName으로 교체
            .resizable()
            .scaledToFit()
            .scaleEffect(scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        scale = lastScale * value
                    }
                    .onEnded { _ in
                        scale = min(max(scale, 1.0), 3.0)
                        lastScale = scale
                    }
            )
    }
}
