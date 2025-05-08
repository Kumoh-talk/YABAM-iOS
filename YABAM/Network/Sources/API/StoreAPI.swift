import Alamofire
import Foundation

enum StoreAPI {
    case fetchStore(storeId: Int)
}

extension StoreAPI: YBTargetType {
    var baseURL: URL {
        guard let url = URL(string: APIConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .fetchStore:
            return "/api/v1/store"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchStore:
            return .get
        }
    }
    
    var queryParameters: Parameters? {
        switch self {
        case .fetchStore(let storeId):
            return ["storeId": storeId]
        }
    }
    
    var task: YBTask {
        switch self {
        case .fetchStore:
            return .requestPlain
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .fetchStore:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
