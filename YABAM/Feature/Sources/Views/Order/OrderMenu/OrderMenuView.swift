import SwiftUI

struct OrderMenuView: View {
    let sections: [MenuSection] = SampleData.menuSections
    @State private var selectedSectionID: String?

    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(sections) { section in
                        MenuChip(
                            title: section.title,
                            isSelected: selectedSectionID == section.id
                        ) {
                            selectedSectionID = section.id
                        }
                    }
                }
                .padding()
            }

            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 12) {
                        ForEach(sections) { section in
                            sectionView(for: section)
                                .padding(8)
                            Divider()
                                .padding(8)
                        }
                    }
                    .onChange(of: selectedSectionID) { id in
                        if let id = id {
                            withAnimation {
                                proxy.scrollTo(id, anchor: .top)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("메뉴")
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Section View Builder
    @ViewBuilder
    private func sectionView(for section: MenuSection) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(section.title)
                .font(.title2.bold())
                .padding(.horizontal)
                .id(section.id)

            ForEach(section.items) { item in
                MenuItemView(item: item)
            }
        }
    }
}
