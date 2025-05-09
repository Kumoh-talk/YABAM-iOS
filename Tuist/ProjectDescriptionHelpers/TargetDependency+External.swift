import ProjectDescription

public enum External: String {
    case Alamofire
    case CodeScanner
}

extension TargetDependency {
    public static func external(dependency: External)-> TargetDependency {
        .external(name: dependency.rawValue, condition: .when([.ios]))
    }
}
