import SwiftUI

struct MenuDetailView: View {
    let item: MenuItem
    @State private var quantity: Int = 1
    @ObservedObject var cartManager: CartManager
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
                YBText("\(item.price)원", fontType: .boldHeader4, color: .Neutral.neutral900)
                
                YBText(item.description, fontType: .mediumBody1, color: .Neutral.neutral700)
                    .padding(.top, 4)

            }
            .padding(.top, 24)
            .padding(.horizontal, 24)
            
            YBDivider(color: .Neutral.neutral300, height: 12)
                .padding(.top, 24)
            
            HStack {
                YBText("주문 수량", fontType: .boldBody1, color: .Neutral.neutral800)
                Spacer()
                Stepper(value: $quantity, in: 1...10) {
                    YBText("\(quantity)개", fontType: .mediumBody1, color: .Neutral.neutral800)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)

            Spacer()

            YBButton(title: "메뉴 담기 (\(quantity)개)") {
                for _ in 0..<quantity {
                    cartManager.add(item)
                }
                dismiss()
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .padding(6)
                    .background(
                        Circle()
                            .fill(Color.white)
                            .shadow(radius: 2)
                    )
            } action: {
                dismiss()
            }
        )
    }
}
