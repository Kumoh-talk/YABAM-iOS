import Alamofire
import Core
import Foundation

extension Error {
    var asYBError: YBError {
        if let afError = self as? AFError {
            if afError.isSessionTaskError || afError.isExplicitlyCancelledError {
                return .network
            }
            return .unknown
        }

        if let urlError = self as? URLError {
            switch urlError.code {
            case .timedOut:
                return .timeout
            case .notConnectedToInternet, .cannotFindHost, .cannotConnectToHost:
                return .network
            default:
                return .unknown
            }
        }

        return .unknown
    }
}
