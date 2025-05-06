import SwiftUI
import CoreLocation

struct StoreHeaderView: View {
    let store: Store
    var isDetail: Bool = false
    var userLocation: CLLocation? = nil

    private var nameFont: YBFont {
        isDetail ? .boldHeader2 : .boldHeader4
    }

    private var descriptionFont: YBFont {
        isDetail ? .mediumBody1 : .mediumBody2
    }

    private var statusFont: YBFont {
        isDetail ? .boldBody1 : .boldBody2
    }

    private var reviewFont: YBFont {
        isDetail ? .mediumBody1 : .mediumBody2
    }

    var body: some View {
        VStack(alignment: .leading, spacing: isDetail ? 4 : 0) {
            YBText(store.name, fontType: nameFont, color: .Neutral.neutral900)

            YBText(store.description, fontType: descriptionFont, color: .Neutral.neutral600)

            HStack(spacing: 4) {
                YBText(store.isOpen ? "영업 중" : "영업 종료", fontType: statusFont, color: .Neutral.neutral800)

                if let userLocation, isDetail {
                    YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)
                    
                    YBText("\(store.distance(from: userLocation))", fontType: reviewFont, color: .Neutral.neutral800)
                }
                
                YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)

                YBText("리뷰 수 \(store.reviewCount)", fontType: reviewFont, color: .Neutral.neutral800)

                YBText("·", fontType: .boldBody1, color: .Neutral.neutral600)

                HStack(spacing: 0) {
                    Image(.star)
                        .resizable()
                        .frame(width: 16, height: 16)
                    YBText("\(store.review)", fontType: reviewFont, color: .Neutral.neutral800)
                }
            }
        }
    }
}
