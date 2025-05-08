public struct StoreDTO: Decodable {
    let storeId: Int
    let isOpen: Bool
    let userId: Int
    let userNickname: String
    let storeName: String
    let latitude: Double
    let longitude: Double
    let description: String
    let headImageUrl: String
    let university: String
    let tableTime: Int
    let tableCost: Int
}
