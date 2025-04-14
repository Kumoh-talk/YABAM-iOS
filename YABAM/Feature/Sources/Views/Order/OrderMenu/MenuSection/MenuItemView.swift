import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(.yabamFillLogo) // TODO: item.image로 변경
                .resizable()
                .frame(width: 110, height: 110)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                if item.isRecommended {
                    YBBadge("주인장 추천!")
                }
                
                YBText(item.name, fontType: .boldHeader3, color: .Neutral.neutral900)
                YBText(item.description, fontType: .mediumBody2, color: .Neutral.neutral600)
                    .lineLimit(2)
                    .truncationMode(.tail)
                YBText("\(item.price)원", fontType: .mediumBody1, color: .Neutral.neutral900)
            }
        }
    }
}
