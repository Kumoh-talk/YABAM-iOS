import Combine
import Foundation

public final class DeepLinkManager: ObservableObject {
    @Published public var targetTabIndex: Int? = nil
    @Published public var shouldNavigateToMenu: Bool = false
    @Published var storeId: String? = nil
    @Published var tableId: String? = nil
    
    public init() { }
    
    public func handleDeepLink(url: URL) {
        YBLogger.info("DeepLink URL: \(url)")
        
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            components.host == "yabam.com"
        else { return }
        
        var hasOrderInfo = false
        
        for queryItem in components.queryItems ?? [] {
            switch queryItem.name {
            case "tab":
                if queryItem.value == "order" {
                    targetTabIndex = 1
                }
            case "storeId":
                storeId = queryItem.value
                hasOrderInfo = true
            case "tableId":
                tableId = queryItem.value
                hasOrderInfo = true
            default:
                break
            }
        }
        
        if hasOrderInfo {
            targetTabIndex = 1
            shouldNavigateToMenu = true
        }
    }
}
