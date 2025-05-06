import SwiftUI

struct StoreMenuView: View {
    let store: Store

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            YBText("메뉴 준비 중", fontType: .regularBody2, color: .Neutral.neutral600)
            // TODO: store.menuItems 가 있다면 List로 구현
        }
    }
}
