import SwiftUI

struct TermsOfServiceView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("이용약관")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)

                Group {
                    section("제1조 (목적)", """
                    이 약관은 당사가 제공하는 위치기반 테이블 주문 서비스 및 가게 정보, 리뷰 기능 등의 서비스 이용에 관한 조건 및 절차, 이용자와 당사의 권리와 의무, 책임사항을 명확히 정함을 목적으로 합니다.
                    """)

                    section("제2조 (용어 정의)", """
                    - "서비스": 당사가 제공하는 모든 앱 기능 및 부가 서비스
                    - "이용자": 본 약관에 따라 당사의 서비스를 이용하는 자
                    - "회원": 카카오 또는 애플 계정으로 로그인하여 서비스를 이용하는 자
                    - "게스트": 로그인 없이 일부 기능만 이용하는 사용자
                    """)

                    section("제3조 (약관의 효력 및 변경)", """
                    1. 본 약관은 앱을 통해 공지되며, 동의한 이용자에게 효력을 가집니다.
                    2. 당사는 관련 법령을 위반하지 않는 범위 내에서 약관을 개정할 수 있습니다.
                    3. 변경된 약관은 앱을 통해 공지되며, 계속 서비스를 이용할 경우 동의한 것으로 간주됩니다.
                    """)

                    section("제4조 (서비스의 제공 및 변경)", """
                    1. 당사는 다음과 같은 서비스를 제공합니다:
                       - 테이블 QR 주문 기능
                       - 가게 정보 및 거리 안내
                       - 사용자 리뷰 작성 및 열람
                       - 사용자 계정 기반 개인화 기능

                    2. 서비스 내용은 운영상, 기술상 필요에 따라 변경될 수 있으며, 사전에 앱 내 공지를 통해 안내합니다.
                    """)

                    section("제5조 (이용자의 의무)", """
                    이용자는 다음 행위를 해서는 안 됩니다:
                    - 타인의 정보를 도용하거나 부정 이용하는 행위
                    - QR코드를 악의적으로 조작하는 행위
                    - 리뷰 기능을 통한 비방, 허위 정보 작성
                    - 위치정보를 악용하거나 변조하는 행위
                    - 앱의 정상적인 운영을 방해하는 행위
                    """)

                    section("제6조 (개인정보 보호)", """
                    당사는 개인정보 처리방침에 따라 이용자의 개인정보를 적법하게 보호합니다. 이용자는 개인정보 처리방침을 반드시 확인해야 합니다.
                    """)

                    section("제7조 (서비스의 중단)", """
                    당사는 시스템 점검, 장애 또는 기타 불가피한 사유가 있는 경우 일시적으로 서비스를 중단할 수 있습니다. 이 경우 사전 또는 사후에 앱을 통해 안내합니다.
                    """)

                    section("제8조 (면책조항)", """
                    - 당사는 천재지변, 네트워크 장애, 제3자의 고의적 공격 등 통제 불가능한 사유로 인한 손해에 대해 책임을 지지 않습니다.
                    - 이용자의 귀책 사유로 인해 발생한 문제는 당사가 책임지지 않습니다.
                    """)

                    section("제9조 (준거법 및 관할)", """
                    본 약관은 대한민국 법률에 따라 해석되며, 당사와 이용자 간 분쟁은 당사 소재지를 관할하는 법원의 전속관할로 합니다.
                    """)
                }

                Text("본 약관은 2025년 5월 8일부터 적용됩니다.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("이용약관")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .withNavigationButtons(
            leading: NavigationButtonConfig {
                Image(.popArrow)
            } action: {
                dismiss()
            }
        )
    }

    private func section(_ title: String, _ content: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
            Text(content)
                .font(.body)
        }
    }
}
