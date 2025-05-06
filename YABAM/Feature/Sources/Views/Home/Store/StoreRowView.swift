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
                
                VStack(alignment: .leading, spacing: 0) {
                    YBText(store.name, fontType: .boldHeader3, color: .Neutral.neutral900)
                    
                    YBText(store.description, fontType: .mediumBody2, color: .Neutral.neutral600)
                                        
                    HStack(spacing: 4) {
                        YBText(store.isOpen ? "영업 중" : "영업 종료", fontType: .boldBody2, color: .Neutral.neutral800)
                        
                        YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                        
                        YBText("리뷰 수 \(store.reviewCount)", fontType: .mediumBody2, color: .Neutral.neutral800)
                        
                        YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                        
                        HStack(spacing: 0) {
                            Image(.star).resizable().frame(width: 16, height: 16)
                            
                            YBText("\(store.review)", fontType: .mediumBody2, color: .Neutral.neutral800)
                        }
                    }
                }
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
