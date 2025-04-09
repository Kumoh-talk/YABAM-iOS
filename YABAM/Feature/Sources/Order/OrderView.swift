import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🔍 Search View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.blue.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}
