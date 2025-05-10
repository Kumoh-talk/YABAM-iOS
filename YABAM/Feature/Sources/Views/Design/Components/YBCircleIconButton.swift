import SwiftUI

struct YBCircleIconButton: View {
    let icon: Image

    var body: some View {
        icon
            .resizable()
            .frame(width: 16, height: 16)
            .padding(6)
            .background(
                Circle()
                    .fill(Color.white)
                    .shadow(radius: 2)
            )
    }
}
