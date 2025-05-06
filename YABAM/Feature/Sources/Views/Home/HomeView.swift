import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            StoreListView(stores: StoreSampleData.storeList)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("내 주변 주막", fontType: .mediumHeader4, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
    }
}
