import SwiftUI

struct OrderMenuView: View {
    let sections: [MenuSection] = SampleData.menuSections
    @State private var selectedSectionID: String?

    var body: some View {
        VStack(spacing: 0) {
            MenuChipScrollView(
                sections: sections,
                selectedSectionID: $selectedSectionID
            )

            MenuSectionList(
                sections: sections,
                selectedSectionID: $selectedSectionID
            )
        }
        .navigationTitle("테이블 주문")
        .navigationBarTitleDisplayMode(.inline)
    }
}
