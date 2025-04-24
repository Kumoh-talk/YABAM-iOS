import SwiftUI

public struct YBTabView: View {
    @State private var selectedTab: Int = 0
    
    public init() { }
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    switch selectedTab {
                    case 0: HomeView()
                    case 1: OrderQRCodeView()
                    case 2: OrderHistoryView()
                    case 3: MyPageView()
                    default: HomeView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider()
                HStack {
                    TabBarItem(
                        icon: .homeStroke,
                        selectedIcon: .homeFill,
                        title: "홈",
                        isSelected: selectedTab == 0
                    ) {
                        selectedTab = 0
                    }
                    
                    TabBarItem(
                        icon: .cameraStroke,
                        selectedIcon: .cameraFill,
                        title: "주문하기",
                        isSelected: selectedTab == 1
                    ) {
                        selectedTab = 1
                    }
                    
                    TabBarItem(
                        icon: .orderStroke,
                        selectedIcon: .orderFill,
                        title: "주문내역",
                        isSelected: selectedTab == 2
                    ) {
                        selectedTab = 2
                    }
                    
                    TabBarItem(
                        icon: .mypageStroke,
                        selectedIcon: .mypageFill,
                        title: "마이",
                        isSelected: selectedTab == 3
                    ) {
                        selectedTab = 3
                    }
                }
                .padding(.vertical, 10)
                .background(Color.white)
            }
        }
    }
}
