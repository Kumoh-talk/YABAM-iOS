import SwiftUI

struct YBFullscreenImageViewer: View {
    let imageUrls: [String]
    let initialIndex: Int

    @Environment(\.dismiss) private var dismiss
    @State private var currentIndex: Int

    init(imageUrls: [String], initialIndex: Int) {
        self.imageUrls = imageUrls
        self.initialIndex = initialIndex
        _currentIndex = State(initialValue: initialIndex)
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color.black.ignoresSafeArea()

            TabView(selection: $currentIndex) {
                ForEach(imageUrls.indices, id: \.self) { index in
                    // TODO: URL 이미지로 변경
                    Image(.yabamFillLogo)
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
