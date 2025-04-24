import SwiftUI

struct YBCodeScannerTextSection: View {
    var body: some View {
        VStack(spacing: 8) {
            YBText(
                "테이블에 있는 QR코드를 인식해주세요",
                fontType: .boldHeader1,
                color: .Neutral.neutral800
            )
            .multilineTextAlignment(.center)
            .padding(.top, 80)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .padding(.horizontal, 24)
            
            YBText(
                "QR코드를 인식하면 주문이 시작됩니다",
                fontType: .mediumBody1,
                color: .Neutral.neutral600
            )
            .multilineTextAlignment(.center)
        }
    }
}
