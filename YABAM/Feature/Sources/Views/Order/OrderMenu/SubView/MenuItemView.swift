import SwiftUI

struct MenuItemView: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(.yabamFillLogo)
                .resizable()
                .frame(width: 110, height: 110)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 2) {
                YBText("주인장 추천!", fontType: .boldBody3, color: .Neutral.neutral700)
                    .padding(4)
                    .background(Color.Neutral.neutral100)
                    .cornerRadius(4)
                YBText(item.name, fontType: .boldHeader3, color: .Neutral.neutral900)
                YBText(item.description, fontType: .mediumBody2, color: .Neutral.neutral600)
                YBText("\(item.price)원", fontType: .mediumBody1, color: .Neutral.neutral900)
            }
        }
    }
}
