public protocol OrderServiceInterface {
    
}

public final class OrderService: OrderServiceInterface {
    private let provider: YBProvider<OrderAPI>
    
    public init(provider: YBProvider<OrderAPI> = YBProvider<OrderAPI>()) {
        self.provider = provider
    }
}
