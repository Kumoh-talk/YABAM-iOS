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
                .background(isSelected ? Color.Semantic.info : Color.Neutral.neutral100)
                .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
