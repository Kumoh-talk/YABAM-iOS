import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    var onDelete: (() -> Void)? = nil
    
    var body: some View {
        let isCompact = onDelete != nil
        let imageSize: CGFloat = isCompact ? 80 : 110
        let nameFont: YBFont = isCompact ? .boldBody1 : .boldHeader3
        let descriptionFont: YBFont = isCompact ? .mediumBody3 : .mediumBody2
        let priceFont: YBFont = isCompact ? .mediumBody2 : .mediumBody1

        HStack(alignment: .center, spacing: 12) {
            Image(.yabamFillLogo) // TODO: item.image로 변경
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                if item.isRecommended {
                    YBBadge("주인장 추천!")
                }
                
                YBText(item.name, fontType: nameFont, color: .Neutral.neutral900)
                YBText(item.description, fontType: descriptionFont, color: .Neutral.neutral600)
                    .lineLimit(2)
                    .truncationMode(.tail)
                YBText("\(item.price)원", fontType: priceFont, color: .Neutral.neutral900)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            if let onDelete = onDelete {
                Button(action: onDelete) {
                    Image(.trash)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                }
            }
        }
    }
}
