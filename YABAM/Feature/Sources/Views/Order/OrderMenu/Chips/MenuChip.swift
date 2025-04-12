import SwiftUI

struct MenuChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            YBText(title, fontType: .mediumBody2, color: isSelected ? Color.white : Color.Neutral.neutral800)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(
                    Group {
                        if isSelected {
                            Color.Semantic.info
                        } else {
                            Color.Neutral.neutral100
                        }
                    }
                    .animation(.easeInOut(duration: 0.2), value: isSelected)
                )
                .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
