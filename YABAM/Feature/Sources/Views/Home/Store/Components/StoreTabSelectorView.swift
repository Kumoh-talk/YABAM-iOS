import SwiftUI

struct StoreTabSelectorView: View {
    @Binding var selectedTab: StoreDetailTab

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(StoreDetailTab.allCases, id: \.self) { tab in
                    Button(action: {
                        selectedTab = tab
                    }) {
                        YBText(
                            tab.title,
                            fontType: .boldBody1,
                            color: selectedTab == tab ? .blue : .gray
                        )
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(selectedTab == tab ? Color.blue.opacity(0.1) : Color.clear)
                        .cornerRadius(16)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
    }
}
