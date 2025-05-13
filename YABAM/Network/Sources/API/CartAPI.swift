import Alamofire
import Core
import Foundation

public enum CartAPI {
    // 장바구니 메뉴 추가
    case createMenuInCart(receiptId: Int, menuId: Int, quantity: Int) // 장바구니 메뉴 추가
    case fetchCart(receiptId: Int) // 장바구니 조회
    case deleteCartMenu(receiptId: Int, menuId: Int) // 장바구니 메뉴 삭제
}

extension CartAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appendingPathComponent(YBConstant.userURL)
    }
    
    public var path: String {
        switch self {
        case .createMenuInCart,
                .fetchCart:
            return "/api/v1/cart"
        case .deleteCartMenu:
            return "/api/v1/cart/menu"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .createMenuInCart:
            return .post
        case .fetchCart:
            return .get
        case .deleteCartMenu:
            return .delete
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .createMenuInCart(let receiptId, let menuId, let quantity):
            return [
                "receiptId": receiptId,
                "menuId": menuId,
                "quantity": quantity
            ]
        case .fetchCart(let receiptId):
            return [
                "receiptId": receiptId
            ]
        case .deleteCartMenu(let receiptId, let menuId):
            return [
                "receiptId": receiptId,
                "menuId": menuId
            ]
        }
    }
    
    public var task: YBTask {
        switch self {
        case .createMenuInCart,
                .fetchCart,
                .deleteCartMenu:
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
