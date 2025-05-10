import ProjectDescription

public enum External: String {
    case Alamofire
    case CodeScanner
    case KakaoSDKAuth
    case KakaoSDKUser
    case KeyChainManager = "KeyChainManager-KJ"
}

extension TargetDependency {
    public static func external(dependency: External)-> TargetDependency {
        .external(name: dependency.rawValue, condition: .when([.ios]))
    }
}
