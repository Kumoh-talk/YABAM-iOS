import SwiftUI
import Core

struct OrderView: View {
    @State private var scannerError: String? = nil
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            YBCodeScannerTextSection()
            
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
    }
}
