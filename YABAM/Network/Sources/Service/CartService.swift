public protocol CartServiceInterface {
    
}

public final class CartService: CartServiceInterface {
    private let provider: YBProvider<CartAPI>
    
    public init(provider: YBProvider<CartAPI> = YBProvider<CartAPI>()) {
        self.provider = provider
    }
}
