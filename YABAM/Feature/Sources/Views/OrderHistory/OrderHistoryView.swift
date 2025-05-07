import SwiftUI

struct OrderHistoryView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🔍 OrderHistory View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.blue.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("주문내역", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
    }
}
