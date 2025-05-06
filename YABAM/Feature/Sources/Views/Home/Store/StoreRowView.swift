import SwiftUI
import CoreLocation

struct StoreRowView: View {
    let store: Store
    let userLocation: CLLocation?
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            HStack(alignment: .top, spacing: 12) {
                Image(.yabamFillLogo) // TODO: URL 기반 이미지로 교체
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
                
                StoreHeaderView(store: store)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(store.storeImageUrls, id: \.self) { _ in
                        Image(.yabamFillLogo) // TODO: URL 기반 이미지로 교체
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 90, height: 130)
                            .cornerRadius(6)
                    }
                }
            }
            
            YBDivider()
        }
        .padding(.top, Constants.spacing)
    }
}

extension StoreRowView {
    private enum Constants {
        static let imageSize: CGFloat = 50
        static let imageCornerRadius: CGFloat = 8
        static let spacing: CGFloat = 16
    }
}
