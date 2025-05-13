import Alamofire
import Core
import Foundation

public enum OrderAPI {
    case createOrder(receiptId: Int) // 장바구니에 담긴 메뉴를 기반으로 주문 생성
    case fetchOrderDetail(receiptId: Int) // 주문 상세 조회
}

extension OrderAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appendingPathComponent(YBConstant.userURL)
    }
    
    public var path: String {
        switch self {
        case .createOrder(let receiptId):
            return "/api/v1/receipts/\(receiptId)/orders/with-cart"
        case .fetchOrderDetail(let receiptId):
            return "/api/v1/receipts/\(receiptId)/orders"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .createOrder:
            return .post
        case .fetchOrderDetail:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .createOrder,
                .fetchOrderDetail:
            return nil
        }
    }
    
    public var task: YBTask {
        switch self {
        case .createOrder,
                .fetchOrderDetail:
            return .requestPlain
        }
    }
    
    public var headers: HTTPHeaders? {
        let token = YBTokenManager.shared.accessToken ?? ""
        return [
            .contentType("application/json"),
            .authorization(bearerToken: token)
        ]
    }
}
