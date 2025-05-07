import SwiftUI

struct OrderHistoryStoreSummaryView: View {
    let imageName: ImageResource
    let storeName: String
    let menuSummary: String

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(6)
            
            VStack(alignment: .leading, spacing: 4) {
                YBText(storeName, fontType: .boldBody1, color: .Neutral.neutral900)
                YBText(menuSummary, fontType: .regularBody2, color: .Neutral.neutral700)
            }
            Spacer()
        }
    }
}
