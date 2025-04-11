import SwiftUI

struct YBCodeScannerStatusView: View {
    let error: String?
    let isLoading: Bool
    
    var body: some View {
        VStack {
            if let error = error {
                Text(error)
                    .foregroundColor(.red)
                    .padding()
            }
            
            if isLoading {
                ProgressView()
                    .padding()
            }
        }
    }
}
