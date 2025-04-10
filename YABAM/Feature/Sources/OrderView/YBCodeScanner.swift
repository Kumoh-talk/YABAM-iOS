import SwiftUI
import Core
import AVFoundation
import CodeScanner

struct YBCodeScanner: View {
    var onSuccess: (String) -> Void

    @State private var showPermissionAlert = false

    var body: some View {
        VStack {
            CodeScannerView(
                codeTypes: [.qr],
                videoCaptureDevice: AVCaptureDevice.zoomedCameraForQRCode(withMinimumCodeSize: 20)
            ) { result in
                switch result {
                case .success(let scanResult):
                    onSuccess(scanResult.string)

                case .failure(let error):
                    YBLogger.error("Error scanning QR code: \(error.localizedDescription)")
                    checkCameraPermission()
                }
            }
            .frame(width: UIScreen.main.bounds.width - 80)
            .frame(
                minHeight: UIScreen.main.bounds.width - 80,
                maxHeight: UIScreen.main.bounds.height / 2
            )
            .background(Color.white)
            .cornerRadius(16)
        }
        .onAppear {
            checkCameraPermission()
        }
        .alert("카메라 권한이 필요합니다", isPresented: $showPermissionAlert) {
            Button("설정으로 이동") {
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url)
                }
            }
            Button("취소", role: .cancel) {}
        } message: {
            Text("QR코드를 스캔하려면 카메라 접근 권한이 필요해요")
        }
    }

    private func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .denied || status == .restricted {
            showPermissionAlert = true
        }
    }
}
