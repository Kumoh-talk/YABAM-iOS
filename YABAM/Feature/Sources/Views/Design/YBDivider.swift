import SwiftUI

struct YBDivider: View {
    var color: Color = .Neutral.neutral200
    var height: CGFloat = 1

    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: height)
            .edgesIgnoringSafeArea(.horizontal)
    }
}
