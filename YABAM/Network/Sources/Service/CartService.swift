public protocol CartServiceInterface {
    func createMenuInCart(receiptId: Int, menuId: Int, quantity: Int) async throws
    func fetchCart(receiptId: Int) async throws -> CartResponseDto
    func deleteCartMenu(receiptId: Int, menuId: Int) async throws
}

public final class CartService: CartServiceInterface {
    private let provider: YBProvider<CartAPI>
    
    public init(provider: YBProvider<CartAPI> = YBProvider<CartAPI>()) {
        self.provider = provider
    }
    
    public func createMenuInCart(receiptId: Int, menuId: Int, quantity: Int) async throws {
        try await provider.requestDecodable(
            .createMenuInCart(
                receiptId: receiptId,
                menuId: menuId,
                quantity: quantity
            ),
            as: AnyDecodable.self
        )
    }
    
    public func fetchCart(receiptId: Int) async throws -> CartResponseDto {
        return try await provider.requestDecodable(
            .fetchCart(receiptId: receiptId),
            as: CartResponseDto.self
        )
    }
    
    public func deleteCartMenu(receiptId: Int, menuId: Int) async throws {
        try await provider.requestDecodable(
            .deleteCartMenu(
                receiptId: receiptId,
                menuId: menuId
            ),
            as: AnyDecodable.self
        )
    }
}
