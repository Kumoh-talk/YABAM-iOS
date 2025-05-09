public protocol StoreRepositoryInterface {
    func fetchStore(storeId: Int) async throws -> StoreDTO
}

public struct StoreRepository: StoreRepositoryInterface {
    private let service: StoreServiceInterface
    
    public init(service: StoreServiceInterface) {
        self.service = service
    }
    
    public func fetchStore(storeId: Int) async throws -> StoreDTO {
        try await service.fetchStore(storeId: storeId)
    }
}
