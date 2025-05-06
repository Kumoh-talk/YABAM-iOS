import SwiftUI

struct StoreImageSliderView: View {
    let imageUrls: [String]

    var body: some View {
        TabView {
            ForEach(imageUrls, id: \.self) { _ in
                Image(.yabamFillLogo) // TODO: URL 기반 이미지로 교체
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped()
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 200)
    }
}
