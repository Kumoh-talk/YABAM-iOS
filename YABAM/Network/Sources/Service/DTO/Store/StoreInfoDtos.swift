public struct StoreInfoDtos: Decodable {
    public let storeId: Int
    public let storeName: String
    public let isOpened: Bool
    public let headImageUrl: String
    public let description: String
    public let reviewCount: Int
    public let storeDetailImageUrls: [String]
    
    public init(
        storeId: Int,
        storeName: String,
        isOpened: Bool,
        headImageUrl: String,
        description: String,
        reviewCount: Int,
        storeDetailImageUrls: [String]
    ) {
        self.storeId = storeId
        self.storeName = storeName
        self.isOpened = isOpened
        self.headImageUrl = headImageUrl
        self.description = description
        self.reviewCount = reviewCount
        self.storeDetailImageUrls = storeDetailImageUrls
    }
}
