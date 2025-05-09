import Foundation
import Alamofire

public enum YBTask {
    /// A plain request with no parameters or body.
    case requestPlain

    /// A request with an Encodable object encoded as JSON in the HTTP body.
    case requestJSONEncodable(encodable: Encodable)

    /// A request with parameters sent either in the body or as query depending on encoding.
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}
