import SwiftUI

struct MenuChipScrollView: View {
    let sections: [MenuSection]
    @Binding var selectedSectionID: String?

    var body: some View {
        ZStack {
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(sections) { section in
                            MenuChip(title: section.title, isSelected: selectedSectionID == section.id) {
                                selectedSectionID = section.id
                            }
                        }
                    }
                }
            }
        }
        .padding(.leading, 14)
        .padding(.bottom, 6)
    }
}
