import SwiftUI
import Core
import AVFoundation
import CodeScanner

struct YBCodeScanner: View {
    var onSuccess: (String) -> Void

    @State private var showPermissionAlert = false
    @State private var isScanning: Bool = true

    var body: some View {
        VStack {
            if isScanning {
                CodeScannerView(
                    codeTypes: [.qr],
                    videoCaptureDevice: AVCaptureDevice.zoomedCameraForQRCode(withMinimumCodeSize: 20),
                    completion: handleScan
                )
                .frame(width: UIScreen.main.bounds.width - 80)
                .frame(
                    minHeight: UIScreen.main.bounds.width - 80,
                    maxHeight: UIScreen.main.bounds.height / 2
                )
                .background(Color.white)
                .cornerRadius(16)
            }
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

    private func handleScan(result: Result<ScanResult, ScanError>) {
        switch result {
        case .success(let scanResult):
            isScanning = false
            onSuccess(scanResult.string)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isScanning = true
            }

        case .failure(let error):
            YBLogger.error("QR 인식 에러: \(error.localizedDescription)")
            checkCameraPermission()
        }
    }

    private func checkCameraPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .denied || status == .restricted {
            showPermissionAlert = true
        }
    }
}
