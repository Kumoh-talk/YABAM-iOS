import SwiftUI
import Core

struct MenuCartView: View {
    @ObservedObject var cartManager: CartManager
    
    var body: some View {
        if cartManager.hasItems {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(cartManager.items) { item in
                        MenuItemView(item: item)
                            .padding(.horizontal, 16)
                    }
                }
            }
        } else {
            YBText(
                "현재 담겨있는 메뉴가 없어요\n아래 메뉴추가를 눌러 메뉴를 담아주세요",
                fontType: .mediumBody1,
                color: .Neutral.neutral600
            )
            .multilineTextAlignment(.center)
        }
    }
}
