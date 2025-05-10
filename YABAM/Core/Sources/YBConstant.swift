import Foundation

public enum YBConstant {
    public static let baseURL = Bundle.main.infoDictionary?["SERVER_URL"] as? String ?? "http://localhost:8080"
    public static let accessToken = "accessToken"
    public static let refreshToken = "refreshToken"
    public static let refreshTokenExpiredAt = "refreshTokenExpiredAt"
    public static let oauthKakao = "kakao"
    public static let oauthApple = "apple"
}
