import SwiftUI

struct PrivacyPolicyView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("개인정보 처리방침")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 8)

                Group {
                    section("1. 수집하는 개인정보 항목", """
                    [1] 필수 수집 항목
                    - 로그인 정보: 카카오 또는 애플 계정을 통한 사용자 인증 (고유 식별자, 이메일 등)
                    - 디바이스 정보: 기기 모델, OS 버전, 앱 버전 등

                    [2] 선택 수집 항목
                    - 위치정보: 사용자 위치 기반으로 주변 가게 정보 제공
                    - 카메라 접근 권한: QR코드를 통한 테이블 연결
                    - 사진 라이브러리: 리뷰 작성 시 사진 업로드
                    """)

                    section("2. 개인정보 수집 및 이용 목적", """
                    - 회원 인증 및 관리
                    - 테이블 주문 기능 제공
                    - 가게 정보 제공 (거리 표시 등)
                    - 리뷰 작성 기능
                    - 서비스 개선
                    """)

                    section("3. 개인정보 보유 및 이용기간", """
                    - 회원 탈퇴 시 즉시 파기
                    - 법령에 따라 보존이 필요한 경우는 해당 기간 동안 보관
                    """)

                    section("4. 개인정보 제3자 제공", """
                    - 원칙적으로 외부 제공 없음
                    - 단, 사용자 동의 또는 법령에 따라 제공될 수 있음
                    """)

                    section("5. 개인정보 처리 위탁", """
                    - 현재 위탁 사항 없음
                    - 향후 발생 시 사전 고지 및 동의 예정
                    """)

                    section("6. 사용자의 권리", """
                    - 개인정보 열람, 수정, 삭제 요청 가능
                    - 앱 내 설정 또는 고객센터를 통해 요청 가능
                    """)

                    section("7. 개인정보 보호 조치", """
                    - 암호화 저장 및 최소 권한 접근
                    - 보안 업데이트를 통한 보호
                    """)

                    section("8. 책임자 및 문의처", """
                    - 담당자: 개인정보 보호 책임자
                    - 이메일: gywns626@naver.com
                    - 문의 가능 시간: 평일 10:00 ~ 18:00
                    """)
                }

                Text("본 방침은 2025년 5월 8일부터 적용됩니다.")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("개인정보처리방침")
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
