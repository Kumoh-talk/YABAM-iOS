public struct YBResponse<T: Decodable>: Decodable {
    let success: String
    let data: T?
    let code: String?
    let message: String?
    
    var isSuccess: Bool {
        return success == "true"
    }
}
