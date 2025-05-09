public protocol StoreServiceInterface {
    func fetchStore(storeId: Int) async throws -> StoreDTO
}
