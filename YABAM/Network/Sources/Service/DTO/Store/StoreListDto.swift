public struct StoreListDto: Decodable {
    public let totalCount: Int
    public let hasNextPage: Bool
    public let lastReviewCount: Int?
    public let lastStoreId: Int?
    public let storeInfoDtos: [StoreInfoDto]
    
    public init(
        totalCount: Int,
        hasNextPage: Bool,
        lastReviewCount: Int?,
        lastStoreId: Int?,
        storeInfoDtos: [StoreInfoDto]
    ) {
        self.totalCount = totalCount
        self.hasNextPage = hasNextPage
        self.lastReviewCount = lastReviewCount
        self.lastStoreId = lastStoreId
        self.storeInfoDtos = storeInfoDtos
    }
}
