public final class DIContainer {
    public static let shared = DIContainer()
    private var objects: [String: Any] = [:]
    
    private init() {}
    
    public func register<T>(_ type: T.Type, object: Any) {
        let key = String(describing: type)
        objects[key] = object
    }
    
    public func resolve<T>(_ type: T.Type) throws -> T {
        let key = String(describing: type)
        guard let object = objects[key] as? T else {
            YBLogger.error("\(#function): \(key)에 해당하는 object 없음")
            throw YBError.dependencyInjectionFailure
        }
        return object
    }
}
