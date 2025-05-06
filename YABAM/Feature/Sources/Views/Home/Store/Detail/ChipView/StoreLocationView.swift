import SwiftUI

struct StoreLocationView: View {
    let store: Store

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            YBText("위치: \(store.location)", fontType: .regularBody2, color: .Neutral.neutral600)
            // TODO: 지도 SDK (예: Naver Map SDK) 또는 WebView 연동
        }
    }
}
