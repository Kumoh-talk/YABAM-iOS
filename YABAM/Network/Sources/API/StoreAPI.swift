import Alamofire
import Foundation

enum StoreAPI {
    case getStore(storeId: Int)
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
        case .getStore:
            return "/api/v1/store"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getStore:
            return .get
        }
    }
    
    var queryParameters: Parameters? {
        switch self {
        case .getStore(let storeId):
            return ["storeId": storeId]
        }
    }
    
    var task: YBTask {
        switch self {
        case .getStore:
            return .requestPlain
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .getStore:
            let headers: HTTPHeaders = [
                .contentType("application/json")
            ]
            return headers
        }
    }
}
