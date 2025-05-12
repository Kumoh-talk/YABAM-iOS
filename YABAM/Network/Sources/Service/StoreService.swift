public protocol StoreServiceInterface {
    func fetchStore(storeId: Int) async throws -> StoreDetailDto
}

public final class StoreService: StoreServiceInterface {
    private let provider: YBProvider<StoreAPI>
    
    public init(provider: YBProvider<StoreAPI> = YBProvider<StoreAPI>()) {
        self.provider = provider
    }
    
    public func fetchStore(storeId: Int) async throws -> StoreDetailDto {
        try await provider.requestDecodable(.fetchStore(storeId: storeId), as: StoreDetailDto.self)
    }
}
