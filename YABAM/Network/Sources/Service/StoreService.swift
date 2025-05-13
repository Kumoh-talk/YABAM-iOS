public protocol StoreServiceInterface {
    func fetchStore(storeId: Int) async throws -> StoreDetailDto
    func fetchStoreList(lastReviewCount: Int?, lastStoreId: Int?, size: Int) async throws -> StoreListDto
}

public final class StoreService: StoreServiceInterface {
    private let provider: YBProvider<StoreAPI>
    
    public init(provider: YBProvider<StoreAPI> = YBProvider<StoreAPI>()) {
        self.provider = provider
    }
    
    public func fetchStore(storeId: Int) async throws -> StoreDetailDto {
        try await provider.requestDecodable(
            .fetchStore(storeId: storeId),
            as: StoreDetailDto.self
        )
    }
    
    public func fetchStoreList(lastReviewCount: Int?, lastStoreId: Int?, size: Int) async throws -> StoreListDto {
        try await provider.requestDecodable(
            .fetchStoreList(lastReviewCount: lastReviewCount, lastStoreId: lastStoreId, size: size),
            as: StoreListDto.self
        )
    }
}
