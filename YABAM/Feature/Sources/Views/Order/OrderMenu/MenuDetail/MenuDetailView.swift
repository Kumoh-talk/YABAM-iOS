import SwiftUI

struct MenuDetailView: View {
    let item: MenuItem
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            Image(.yabamFillLogo) // TODO: item.image로 변경
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .clipped()
            
            VStack(alignment: .leading, spacing: 12) {
                if item.isRecommended {
                    YBBadge("주인장 추천!")
                }
                
                YBText(item.name, fontType: .boldHeader1, color: .Neutral.neutral800)
                
                YBText(item.description, fontType: .boldBody1, color: .Neutral.neutral800)
                
                Spacer()
                
                Button {
                    
                } label: {
                    YBText("메뉴 담기 - \(item.price)원", fontType: .boldBody1, color: .white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.Semantic.info)
                        .cornerRadius(12)
                        .padding(.horizontal)
                        .padding(.bottom, 12)
                }
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
