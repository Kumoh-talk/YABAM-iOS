import Alamofire
import Core
import Foundation

public enum StoreAPI {
    case fetchStore(storeId: Int)
    case fetchStoreList(lastReviewCount: Int?, lastStoreId: Int?, size: Int)
}

extension StoreAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appending(path: YBConstant.userURL)
    }
    
    public var path: String {
        switch self {
        case .fetchStore:
            return "/api/v1/store"
        case .fetchStoreList:
            return "/api/v1/stores"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .fetchStore,
                .fetchStoreList:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .fetchStore(let storeId):
            return ["storeId": storeId]
        case .fetchStoreList(let lastReviewCount, let lastStoreId, let size):
            return [
                "lastReviewCount": lastReviewCount,
                "lastStoreId": lastStoreId,
                "size": size
            ]
        }
    }
    
    public var task: YBTask {
        switch self {
        case .fetchStore,
                .fetchStoreList:
            return .requestPlain
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .fetchStore,
                .fetchStoreList:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
