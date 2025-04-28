import SwiftUI

struct MenuSectionView: View {
    let section: MenuSection
    @ObservedObject var cartManager: CartManager

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            YBText(section.title, fontType: .boldHeader2, color: .Neutral.neutral900)
                .padding(.horizontal)
                .id(section.id)

            ForEach(section.items) { item in
                NavigationLink(destination: MenuDetailView(item: item, cartManager: cartManager)) {
                    MenuItemView(item: item)
                }
                .buttonStyle(PlainButtonStyle())
                
                if item != section.items.last {
                    YBDivider()
                        .padding(.vertical, 2)
                        .padding(.horizontal, 8)
                }
            }
        }
    }
}
