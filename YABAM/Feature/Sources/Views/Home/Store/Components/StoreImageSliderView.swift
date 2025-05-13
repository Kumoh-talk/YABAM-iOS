import SwiftUI

struct StoreImageSliderView: View {
    let imageUrls: [String]
    @Binding var selectedIndex: Int
    @Binding var isPresented: Bool

    var body: some View {
        TabView(selection: $selectedIndex) {
            ForEach(imageUrls.indices, id: \.self) { index in
                // TODO: URL 이미지로 변경
                Image(.yabamFillLogo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipped()
                    .onTapGesture {
                        isPresented = true
                    }
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height: 300)
    }
}
