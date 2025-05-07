import SwiftUI
import Core

struct OrderHistoryHeaderView: View {
    let date: Date
    let onDetailTap: () -> Void

    var body: some View {
        HStack {
            YBText(date.convertToString(formatType: .monthDayWithWeekday), fontType: .mediumBody2, color: .Neutral.neutral700)
            
            Spacer()
            
            Button(action: onDetailTap) {
                YBText("주문상세", fontType: .mediumBody2, color: .Neutral.neutral700)
                    .padding(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
            }
        }
    }
}
