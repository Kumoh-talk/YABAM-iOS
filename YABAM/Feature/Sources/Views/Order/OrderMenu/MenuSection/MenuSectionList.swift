import SwiftUI

struct MenuSectionList: View {
    let sections: [MenuSection]
    @Binding var selectedSectionID: String?

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 12) {
                    ForEach(sections) { section in
                        MenuSectionView(section: section)
                            .padding(8)

                        YBDivider(color: .Neutral.neutral300, height: 12)
                    }
                }
                .onChange(of: selectedSectionID) { id in
                    if let id {
                        withAnimation {
                            proxy.scrollTo(id, anchor: .top)
                        }
                    }
                }
            }
        }
    }
}
