import SwiftUI

struct StoreTabSelectorView: View {
    @Binding var selectedTab: StoreDetailTab

    var body: some View {
        HStack(spacing: 0) {
            ForEach(StoreDetailTab.allCases, id: \.self) { tab in
                Button(action: {
                    selectedTab = tab
                }) {
                    VStack {
                        YBText(
                            tab.title,
                            fontType: .boldBody1,
                            color: selectedTab == tab ? .Semantic.info : .Neutral.neutral600
                        )
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        
                        Rectangle()
                            .fill(selectedTab == tab ? Color.Semantic.info : Color.Neutral.neutral100)
                            .frame(height: 2)
                    }
                    .background(Color.white)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 0))
    }
}
