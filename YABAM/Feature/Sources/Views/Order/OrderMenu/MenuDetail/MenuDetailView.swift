import SwiftUI

struct MenuDetailView: View {
    let item: MenuItem
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(.yabamFillLogo) // TODO: item.image로 변경
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            VStack(alignment: .leading, spacing: 2) {
                if item.isRecommended {
                    YBBadge("주인장 추천!")
                }
                
                YBText(item.name, fontType: .boldHeader1, color: .Neutral.neutral900)
                YBText("\(item.price)원", fontType: .boldHeader3, color: .Neutral.neutral900)
                
                YBText(item.description, fontType: .mediumBody1, color: .Neutral.neutral700)
                    .padding(.top, 4)

                Spacer()
            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
            
            YBButton(title: "메뉴 담기") {
                print("메뉴 담기 버튼 클릭")
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig(
                image: Image(systemName: "chevron.left"),
                action: { dismiss() }
            )
        )
    }
}
