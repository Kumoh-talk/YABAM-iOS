import SwiftUI

struct ConfirmationPopup: View {
    let type: MyPagePopupType
    @Binding var isPresented: Bool
    let onConfirm: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text(type == .logout ? "로그아웃 하시겠어요?" : "정말 회원탈퇴 하시겠어요?")
                    .font(.headline)
                    .padding()

                HStack {
                    Button("취소") {
                        isPresented = false
                    }
                    .foregroundColor(.gray)

                    Spacer()

                    Button("확인") {
                        onConfirm()
                        isPresented = false
                    }
                    .foregroundColor(.red)
                }
                .padding(.horizontal)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 10)
            .frame(maxWidth: 300)
        }
    }
}
