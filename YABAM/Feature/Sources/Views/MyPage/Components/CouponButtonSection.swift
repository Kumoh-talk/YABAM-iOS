import SwiftUI

struct CouponButtonSection: View {
    var body: some View {
        VStack {
            Button(action: {
                // 쿠폰 액션
            }) {
                HStack {
                    YBText("쿠폰함", fontType: .mediumBody1, color: .Neutral.neutral900)
                    Spacer()
                    Image(systemName: "ticket")
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
        }
        .padding(.horizontal)
    }
}
