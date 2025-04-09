import SwiftUI

public struct YBTabView: View {
    @State private var selectedTab: Int = 0
    
    public init() { }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                switch selectedTab {
                case 0: HomeView()
                case 1: OrderView()
                case 2: MyPageView()
                default: HomeView()
                }
            }
            
            HStack {
                TabBarItem(
                    icon: .homeStroke,
                    selectedIcon: .homeFill,
                    title: "위치",
                    isSelected: selectedTab == 0
                ) {
                    selectedTab = 0
                }
                
                TabBarItem(
                    icon: .orderStroke,
                    selectedIcon: .orderFill,
                    title: "주문",
                    isSelected: selectedTab == 1
                ) {
                    selectedTab = 1
                }
                
                TabBarItem(
                    icon: .mypageStroke,
                    selectedIcon: .mypageFill,
                    title: "프로필",
                    isSelected: selectedTab == 2
                ) {
                    selectedTab = 2
                }
            }
            .padding(.vertical, 10)
            .background(Color.white)
        }
    }
}
