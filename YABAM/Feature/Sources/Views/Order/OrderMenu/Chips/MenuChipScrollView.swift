import SwiftUI

struct MenuChipScrollView: View {
    let sections: [MenuSection]
    @Binding var selectedSectionID: String?
    var onCallStaffTapped: () -> Void

    var body: some View {
        ZStack {
            HStack {
                Button {
                    onCallStaffTapped()
                } label: {
                    YBText("직원 호출", fontType: .mediumBody2, color: .Neutral.neutral800)
                }
                .padding(.leading, 16)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(sections) { section in
                            MenuChip(title: section.title, isSelected: selectedSectionID == section.id) {
                                selectedSectionID = section.id
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
