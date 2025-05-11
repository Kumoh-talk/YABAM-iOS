import Alamofire
import Core
import Foundation

public enum StoreAPI {
    case fetchStore(storeId: Int)
}

extension StoreAPI: YBTargetType {
    public var baseURL: URL {
        guard
            let baseURL = URL(string: YBConstant.baseURL)
        else { fatalError("Invalid base URL") }
        let userURL = YBConstant.userURL
        
        return baseURL.appending(path: userURL)
    }
    
    public var path: String {
        switch self {
        case .fetchStore:
            return "/api/v1/store"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .fetchStore:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .fetchStore(let storeId):
            return ["storeId": storeId]
        }
    }
    
    public var task: YBTask {
        switch self {
        case .fetchStore:
            return .requestPlain
        }
    }
    
    public var headers: HTTPHeaders? {
        switch self {
        case .fetchStore:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
