import SwiftUI

struct MenuSectionView: View {
    let section: MenuSection

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            YBText(section.title, fontType: .boldHeader2, color: .Neutral.neutral900)
                .padding(.horizontal)
                .id(section.id)

            ForEach(section.items) { item in
                MenuItemView(item: item)
            }
        }
    }
}
