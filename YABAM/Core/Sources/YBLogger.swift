import OSLog

public enum YBLogger {
    public static func debug<T>(_ object: T?, file: String = #file) {
        #if DEBUG
        let message = object != nil ? "[Debug - \(file)]\n: \(object!)" : "[Debug - \(file)] nil"
        os_log(.debug, "%@", message)
        #endif
    }
    
    public static func info<T>(_ object: T?, file: String = #file) {
        #if DEBUG
        let message = object != nil ? "[Info - \(file)]\n: \(object!)" : "[Info - \(file)] nil"
        os_log(.info, "%@", message)
        #endif
    }
    
    public static func error<T>(_ object: T?, file: String = #file) {
        #if DEBUG
        let message = object != nil ? "[Error - \(file)]\n: \(object!)" : "[Error - \(file)] nil"
        os_log(.error, "%@", message)
        #endif
    }
    
    public static func network<T>(_ object: T?, file: String = #file) {
        #if DEBUG
        let message = object != nil ? "[Network - \(file)]\n: \(object!)" : "[Network - \(file)] nil"
        os_log(.debug, "%@", message)
        #endif
    }
}
