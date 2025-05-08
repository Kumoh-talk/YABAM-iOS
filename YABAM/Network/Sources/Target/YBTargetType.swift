import Foundation
import Alamofire

public protocol YBTargetType {
    /// The target's base `URL`.
    var baseURL: URL { get }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String { get }

    /// The HTTP method used in the request.
    var method: Alamofire.HTTPMethod { get }
    
    /// Query parameters to be included in the URL.
    var queryParameters: Parameters? { get }

    /// The type of task to be performed with the request (e.g., plain, parameters, or JSON body).
    var task: YBTask { get }

    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}
