import Network

struct StoreList {
    let totalCount: Int
    let hasNextPage: Bool
    let lastReviewCount: Int?
    let lastStoreId: Int?
    let storeInfos: [StoreInfo]
    
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
        self.storeInfos = storeInfoDtos
    }
    
    init(storeListDto: StoreListDto) {
        self.totalCount = storeListDto.totalCount
        self.hasNextPage = storeListDto.hasNextPage
        self.lastReviewCount = storeListDto.lastReviewCount
        self.lastStoreId = storeListDto.lastStoreId
        self.storeInfos = storeListDto.storeInfoDtos.map { StoreInfo(storeInfoDto: $0) }
    }
    
    func appending(contentsOf other: StoreList) -> StoreList {
        StoreList(
            totalCount: self.totalCount + other.totalCount,
            hasNextPage: other.hasNextPage,
            lastReviewCount: other.lastReviewCount,
            lastStoreId: other.lastStoreId,
            storeInfoDtos: self.storeInfos + other.storeInfos
        )
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
