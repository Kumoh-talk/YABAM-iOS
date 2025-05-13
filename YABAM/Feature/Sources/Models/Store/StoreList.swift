import Network

struct StoreList {
    let totalCount: Int
    let hasNextPage: Bool
    let lastReviewCount: Int?
    let lastStoreId: Int?
    let storeInfoDtos: [StoreInfo]
    
    init(
        totalCount: Int,
        hasNextPage: Bool,
        lastReviewCount: Int?,
        lastStoreId: Int?,
        storeInfoDtos: [StoreInfo]
    ) {
        self.totalCount = totalCount
        self.hasNextPage = hasNextPage
        self.lastReviewCount = lastReviewCount
        self.lastStoreId = lastStoreId
        self.storeInfoDtos = storeInfoDtos
    }
    
    init(storeListDto: StoreListDto) {
        self.totalCount = storeListDto.totalCount
        self.hasNextPage = storeListDto.hasNextPage
        self.lastReviewCount = storeListDto.lastReviewCount
        self.lastStoreId = storeListDto.lastStoreId
        self.storeInfoDtos = storeListDto.storeInfoDtos.map { StoreInfo(storeInfoDto: $0) }
    }
}

extension StoreList {
    static var empty: StoreList {
        StoreList(
            totalCount: 0,
            hasNextPage: false,
            lastReviewCount: nil,
            lastStoreId: nil,
            storeInfoDtos: []
        )
    }
}
