import SwiftUI

struct MenuCartHeaderView: View {
    let memberCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            YBText("담은 메뉴목록", fontType: .boldHeader2, color: .Neutral.neutral800)
            
            HStack(spacing: 3) {
                YBText("멤버 \(memberCount)명과", fontType: .mediumBody2, color: .Neutral.neutral600)
                YBText("함께 주문 중", fontType: .boldBody2, color: Color.Semantic.info)
            }
        }
        .padding(.leading, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
