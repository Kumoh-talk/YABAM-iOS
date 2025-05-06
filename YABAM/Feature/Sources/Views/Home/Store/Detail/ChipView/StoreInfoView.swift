import SwiftUI

struct StoreInfoView: View {
    let store: Store

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            YBText(store.description, fontType: .mediumBody2, color: .Neutral.neutral800)

            HStack(spacing: 8) {
                YBText(store.isOpen ? "영업 중" : "영업 종료", fontType: .boldBody2, color: .Neutral.neutral800)

                YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)

                YBText("리뷰 수 \(store.reviewCount)", fontType: .mediumBody2, color: .Neutral.neutral800)
            }
        }
    }
}
