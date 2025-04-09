import SwiftUI

struct OrderView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🔍 Order View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.blue.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}
