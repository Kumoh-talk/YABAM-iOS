import SwiftUI
import Core

struct OrderEntryView: View {
    @EnvironmentObject var deepLinkManager: DeepLinkManager
    @State private var showOrderMenu = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Image(systemName: "qrcode.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.top, 40)

            YBText(
                "카메라로 주막 테이블에 있는 QR을 스캔하면\n앉아 있는 테이블과 매장이 자동으로 연결됩니다.",
                fontType: .boldBody1,
                color: .Neutral.neutral800
            )
            .multilineTextAlignment(.center)
            
            YBText(
                "QR 스캔이 어렵다면?\n홈에서 가게 주막들의 정보를 확인하거나\n메뉴를 직접 볼 수 있어요.",
                fontType: .boldBody1,
                color: .Neutral.neutral800
            )
            .multilineTextAlignment(.center)

            Button(action: {
                deepLinkManager.targetTabIndex = 0
            }) {
                YBText("주막 및 메뉴 정보 보러가기", fontType: .boldBody1, color: .Semantic.info)
            }
            
            Spacer()
            Spacer()
        }
        .padding()
        .onReceive(deepLinkManager.$shouldNavigateToMenu) { shouldNavigate in
            if shouldNavigate {
                showOrderMenu = true
                deepLinkManager.shouldNavigateToMenu = false
            }
        }
        .navigationDestination(isPresented: $showOrderMenu) {
            MenuOrderView(sections: MenuSectionSampleData.menuSections)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("주문하기", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: { })
        )
    }
}
