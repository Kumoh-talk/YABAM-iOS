import Foundation

public enum YBConstant {
    public static let baseURL = Bundle.main.infoDictionary?["BASE_SERVER_URL"] as? String ?? "http://localhost:8080"
    public static let authPath = Bundle.main.infoDictionary?["AUTH_PATH"] as? String ?? "/authPathError"
    public static let userURL = Bundle.main.infoDictionary?["USER_PATH"] as? String ?? "/userPathError"
    public static let gatewayURL = Bundle.main.infoDictionary?["GATEWAY_PATH"] as? String ?? "/gatewayPathError"
    public static let accessToken = "accessToken"
    public static let refreshToken = "refreshToken"
    public static let refreshTokenExpiredAt = "refreshTokenExpiredAt"
    public static let oauthKakao = "KAKAO"
    public static let oauthApple = "APPLE"
}
