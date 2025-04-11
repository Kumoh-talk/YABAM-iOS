import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("👤 Profile View")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
        }
        .background(Color.green.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
    }
}
