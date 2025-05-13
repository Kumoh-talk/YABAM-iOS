public struct StoreListDto: Decodable {
    public let totalCount: Int
    public let hasNextPage: Bool
    public let lastReviewCount: Int?
    public let lastStoreId: Int?
    public let storeInfoDtos: [StoreInfoDtos]
    
    public init(
        totalCount: Int,
        hasNextPage: Bool,
        lastReviewCount: Int?,
        lastStoreId: Int?,
        storeInfoDtos: [StoreInfoDtos]
    ) {
        self.totalCount = totalCount
        self.hasNextPage = hasNextPage
        self.lastReviewCount = lastReviewCount
        self.lastStoreId = lastStoreId
        self.storeInfoDtos = storeInfoDtos
    }
}
