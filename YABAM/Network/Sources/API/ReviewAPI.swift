import Alamofire
import Core
import Foundation

public enum ReviewAPI {
    case createReview(dto: ReviewRequestDTO)
    case fetchReviewList(storeId: Int, lastReviewId: Int?, size: Int)
}

extension ReviewAPI: YBTargetType {
    public var baseURL: URL {
        guard let baseURL = URL(string: YBConstant.baseURL) else {
            fatalError("Invalid base URL")
        }
        
        return baseURL.appendingPathComponent(YBConstant.userURL)
    }
    
    public var path: String {
        switch self {
        case .createReview:
            return "/api/v1/review"
        case .fetchReviewList:
            return "/api/v1/reviews"
        }
    }
    
    public var method: HTTPMethod {
        switch self {
        case .createReview:
            return .post
        case .fetchReviewList:
            return .get
        }
    }
    
    public var queryParameters: Parameters? {
        switch self {
        case .createReview:
            return nil
        case .fetchReviewList(let storeId, let lastReviewId, let size):
            var params: [String: Any] = ["storeId": storeId, "size": size]
            if let lastReviewId = lastReviewId {
                params["lastReviewId"] = lastReviewId
            }
            return params
        }
    }
    
    public var task: YBTask {
        switch self {
        case .createReview(let dto):
            return .requestJSONEncodable(encodable: dto)
        case .fetchReviewList:
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
