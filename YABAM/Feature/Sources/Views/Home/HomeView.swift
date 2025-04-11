import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("🏠 Home View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.yellow.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}
