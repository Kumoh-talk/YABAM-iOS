import SwiftUI

struct OrderMenuView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🍔 Order Menu View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.Neutral.neutral50)
        .edgesIgnoringSafeArea(.bottom)
    }
}
