import SwiftUI

struct StoreRowView: View {
    let store: Store
    
    var body: some View {
        VStack(alignment: .leading, spacing: Constants.spacing) {
            HStack(alignment: .top, spacing: 12) {
                // 로고 이미지
                Image(.yabamFillLogo) // TODO: URL 기반 이미지로 교체
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 0) {
                    // 가게 이름
                    YBText(store.name, fontType: .boldHeader3, color: .Neutral.neutral900)
                    
                    // 상태/리뷰
                    HStack(spacing: 2) {
                        YBText(store.isOpen ? "영업 중" : "영업 종료", fontType: .mediumBody2, color: .Neutral.neutral800)
                        
                        YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                        
                        YBText("리뷰 \(store.reviewCount)", fontType: .mediumBody2, color: .Neutral.neutral800)
                    }
                }
            }
            
            // 가게 사진 가로 스크롤
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(store.storeImageUrls, id: \.self) { _ in
                        Image(.yabamFillLogo) // TODO: URL 기반 이미지로 교체
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 150)
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
