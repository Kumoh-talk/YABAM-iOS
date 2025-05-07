import SwiftUI
import Core

struct OrderQRCodeView: View {
    @State private var scannerError: String? = nil
    @State private var isLoading: Bool = false
    @State private var showOrderMenu = false
    
    var body: some View {
        VStack(spacing: 0) {
            YBCodeScannerTextSection()
            
#if DEBUG
            Button {
                showOrderMenu = true
            } label: {
                Text("메뉴 목록보기 (디버깅 모드)")
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
            }
#endif
            
            YBCodeScanner { scannedString in
                isLoading = true
                if let url = URL(string: scannedString) {
                    // TODO: 모든 QR이 스캔되므로 나중에 도메인 나오면 야밤 QR만 인식하도록 변경하기
                    /// https://github.com/Kumoh-talk/YABAM-iOS/pull/8#discussion_r2036429092
                    UIApplication.shared.open(url) { success in
                        isLoading = false
                        if !success {
                            YBLogger.error("QR 코드 스캔 실패: \(scannedString)")
                            scannerError = "URL을 인식할 수 없습니다."
                        }
                    }
                } else {
                    YBLogger.error("QR 코드 스캔 실패: \(scannedString)")
                    isLoading = false
                    scannerError = "QR 코드가 유효하지 않습니다, 다시 시도해주세요."
                }
            }
            .padding(.top, 40)
            
            YBCodeScannerStatusView(error: scannerError, isLoading: isLoading)
            
            Spacer()
        }
        .navigationDestination(isPresented: $showOrderMenu) {
            MenuOrderView(sections: MenuSectionSampleData.menuSections)
        }
        .withNavigationButtons(
            leading: NavigationButtonConfig(content: {
                Image(.yabamEmptyLogo).resizable().frame(width: 24, height: 24)
                YBText("주문하기", fontType: .mediumHeader5, color: .Neutral.neutral900)
            }, action: {
                
            })
        )
    }
}
