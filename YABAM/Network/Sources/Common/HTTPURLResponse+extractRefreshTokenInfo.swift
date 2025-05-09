import Foundation

extension HTTPURLResponse {
    func extractRefreshTokenInfo() -> (token: String, expires: String)? {
        guard let setCookie = allHeaderFields["Set-Cookie"] as? String else { return nil }

        var token: String?
        var expires: String?

        let components = setCookie.components(separatedBy: ";").map { $0.trimmingCharacters(in: .whitespaces) }

        for component in components {
            if component.starts(with: "refreshToken=") {
                token = component.replacingOccurrences(of: "refreshToken=", with: "")
            } else if component.starts(with: "Expires=") {
                expires = component.replacingOccurrences(of: "Expires=", with: "")
            }
        }

        if let token, let expires {
            return (token, expires)
        } else {
            return nil
        }
    }
}
