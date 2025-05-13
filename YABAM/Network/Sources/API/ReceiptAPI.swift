import Alamofire
import Core
import Foundation

public enum ReceiptAPI {
    case createReceipt(queryStoreId: Int, queryTableId: Int) // 영수증 생성
    case fetchReceiptId(tableId: Int) // 테이블에 미정산 된 영수증 id 조회
    case fetchReceiptList(customerId: Int, pageSize: Int, lastReceiptId: Int?) // 고객 별 영수증 내역 무한 스크롤 조회
    case fetchReceiptDetail(receiptId: Int) // 영수증 상세 조회
}

extension ReceiptAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appendingPathComponent(YBConstant.userURL)
    }
    
    public var path: String {
        switch self {
        case .createReceipt:
            return "/api/v1/receipts"
        case .fetchReceiptId(let tableId):
            return "/api/v1/table/\(tableId)/receipts/non-adjust"
        case .fetchReceiptList(let customerId, _, _):
            return "/api/v1/customers/\(customerId)/receipts"
        case .fetchReceiptDetail(let receiptId):
            return "/api/v1/receipts/\(receiptId)"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .createReceipt:
            return .post
        case .fetchReceiptId,
                .fetchReceiptList,
                .fetchReceiptDetail:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .createReceipt(let queryStoreId, let queryTableId):
            return [
                "queryStoreId": queryStoreId,
                "queryTableId": queryTableId
            ]
        case .fetchReceiptId(let tableId):
            return ["tableId": tableId]
        case .fetchReceiptList(_, let pageSize, let lastReceiptId):
            var params: [String: Any] = ["size": pageSize]
            
            if let lastReceiptId = lastReceiptId {
                params["lastReceiptId"] = lastReceiptId
            }
            
            return params
        case .fetchReceiptDetail:
            return nil
        }
    }
    
    public var task: YBTask {
        switch self {
        case .createReceipt,
                .fetchReceiptId,
                .fetchReceiptList,
                .fetchReceiptDetail:
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
