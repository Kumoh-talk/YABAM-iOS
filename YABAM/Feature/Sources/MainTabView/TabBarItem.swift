import SwiftUI

struct TabBarItem: View {
    let icon: ImageResource
    let selectedIcon: ImageResource
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                (isSelected ? Image(selectedIcon) : Image(icon))
                    .font(.system(size: 20))
                    .foregroundColor(isSelected ? .blue : .gray)

                Text(title)
                    .font(.caption)
                    .foregroundColor(isSelected ? Color.Neutral.neutral800 : Color.Neutral.neutral600)
                    .fontWeight(isSelected ? .bold : .regular)
            }
            .frame(maxWidth: .infinity)
        }
    }
}
