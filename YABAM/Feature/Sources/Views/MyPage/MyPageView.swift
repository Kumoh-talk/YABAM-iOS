import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("👤 Profile View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.green.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("마이페이지", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
    }
}
