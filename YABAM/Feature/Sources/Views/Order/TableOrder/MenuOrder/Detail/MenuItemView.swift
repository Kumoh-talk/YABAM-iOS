import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    var quantity: Int? = nil
    var onDelete: (() -> Void)? = nil
    
    private var isCompact: Bool {
        onDelete != nil
    }
    
    private var imageSize: CGFloat {
        isCompact ? 80 : 110
    }
    
    private var nameFont: YBFont {
        isCompact ? .boldBody1 : .boldHeader4
    }
    
    private var descriptionFont: YBFont {
        isCompact ? .mediumBody3 : .mediumBody2
    }
    
    private var priceFont: YBFont {
        isCompact ? .mediumBody2 : .mediumBody1
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(.yabamFillLogo) // TODO: item.image로 변경
                .resizable()
                .frame(width: imageSize, height: imageSize)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                if item.isRecommended && !isCompact {
                    YBBadge("주인장 추천!")
                }
                
                YBText(item.name, fontType: nameFont, color: .Neutral.neutral900)
                
                YBText(item.description, fontType: descriptionFont, color: .Neutral.neutral600)
                    .lineLimit(2)
                    .truncationMode(.tail)
                
                priceSection.padding(.top, 2)
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
    
    @ViewBuilder
    private var priceSection: some View {
        if let quantity = quantity, isCompact {
            HStack(spacing: 4) {
                YBText("\(quantity)개", fontType: priceFont, color: .Neutral.neutral900)
                YBText("-", fontType: priceFont, color: .Neutral.neutral900)
                YBText("\(item.price * quantity)원", fontType: priceFont, color: .Neutral.neutral900)
            }
        } else {
            YBText("\(item.price)원", fontType: priceFont, color: .Neutral.neutral900)
        }
    }
}
