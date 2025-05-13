public protocol RecieptServiceInterface {
    
}

public final class RecieptService: RecieptServiceInterface {
    private let provider: YBProvider<RecieptAPI>
    
    public init(provider: YBProvider<RecieptAPI> = YBProvider<RecieptAPI>()) {
        self.provider = provider
    }
}
