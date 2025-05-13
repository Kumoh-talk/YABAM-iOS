public protocol OrderServiceInterface {
    func createOrder(receiptId: Int) async throws
    func fetchOrderDetail(receiptId: Int) async throws -> OrderAndMenusResponseDto
}

public final class OrderService: OrderServiceInterface {
    private let provider: YBProvider<OrderAPI>
    
    public init(provider: YBProvider<OrderAPI> = YBProvider<OrderAPI>()) {
        self.provider = provider
    }
    
    public func createOrder(receiptId: Int) async throws {
        try await provider.requestDecodable(
            .createOrder(receiptId: receiptId),
            as: EmptyDecodable.self
        )
    }
    
    public func fetchOrderDetail(receiptId: Int) async throws -> OrderAndMenusResponseDto {
        return try await provider.requestDecodable(
            .fetchOrderDetail(receiptId: receiptId),
            as: OrderAndMenusResponseDto.self
        )
    }
}
