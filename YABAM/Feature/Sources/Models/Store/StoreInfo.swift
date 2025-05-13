import Foundation
import Network

struct StoreInfo: Equatable, Identifiable {
    let id: Int
    let storeName: String
    let isOpened: Bool
    let headImageUrl: String
    let description: String
    let reviewCount: Int
    let storeDetailImageUrls: [String]
    
    var logoURL: URL? {
        URL(string: headImageUrl)
    }

    var storeImageURLList: [URL] {
        storeDetailImageUrls.compactMap { URL(string: $0) }
    }
    
    init(
        id: Int,
        storeName: String,
        isOpened: Bool,
        headImageUrl: String,
        description: String,
        reviewCount: Int,
        storeDetailImageUrls: [String]
    ) {
        self.id = id
        self.storeName = storeName
        self.isOpened = isOpened
        self.headImageUrl = headImageUrl
        self.description = description
        self.reviewCount = reviewCount
        self.storeDetailImageUrls = storeDetailImageUrls
    }
    
    init(storeInfoDto: StoreInfoDto) {
        self.id = storeInfoDto.storeId
        self.storeName = storeInfoDto.storeName
        self.isOpened = storeInfoDto.isOpened
        self.headImageUrl = storeInfoDto.headImageUrl
        self.description = storeInfoDto.description
        self.reviewCount = storeInfoDto.reviewCount
        self.storeDetailImageUrls = storeInfoDto.storeDetailImageUrls
    }
}
