protocol StoreServiceInterface {
    func fetchStore(storeId: Int) async throws -> StoreDTO
}

final class StoreService: StoreServiceInterface {
    private let provider = YBProvider<StoreAPI>()
    
    func fetchStore(storeId: Int) async throws -> StoreDTO {
        try await provider.requestDecodable(.fetchStore(storeId: storeId), as: StoreDTO.self)
    }
}
