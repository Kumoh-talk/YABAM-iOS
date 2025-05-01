import SwiftUI

struct StoreDetailView: View {
    let store: Store
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                TabView {
                    ForEach(store.storeImageUrls, id: \.self) { urlString in
                        Image(.yabamFillLogo) // TODO: URL 기반 이미지로 변경
                            .resizable()
                            .frame(height: 200)
                            .clipped()
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 200)

                VStack(alignment: .leading, spacing: 8) {
                    YBText(
                        store.name,
                        fontType: .boldHeader2,
                        color: .Neutral.neutral900
                    )

                    YBText(
                        store.description,
                        fontType: .boldBody2,
                        color: .Neutral.neutral700
                    )

                    YBText(
                        "리뷰 수: \(store.reviewCount)",
                        fontType: .regularBody2,
                        color: .Neutral.neutral500
                    )
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(store.name)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            }
        )
    }
}
