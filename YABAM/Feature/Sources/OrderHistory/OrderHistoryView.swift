import SwiftUI

struct OrderHistoryView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🔍 OrderHistory View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.blue.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}
