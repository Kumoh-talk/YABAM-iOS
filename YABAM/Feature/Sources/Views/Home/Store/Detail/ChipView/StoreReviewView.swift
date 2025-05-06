import SwiftUI

struct StoreReviewView: View {
    let store: Store

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            YBText("리뷰가 아직 없습니다", fontType: .regularBody2, color: .Neutral.neutral600)
            // TODO: store.reviews 가 있다면 ScrollView로 리스트 구성
        }
    }
}
