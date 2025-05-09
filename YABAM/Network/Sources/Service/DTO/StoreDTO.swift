public struct StoreDTO: Decodable, Sendable {
    public let storeId: Int
    public let isOpen: Bool
    public let userId: Int
    public let userNickname: String
    public let storeName: String
    public let latitude: Double
    public let longitude: Double
    public let description: String
    public let headImageUrl: String
    public let university: String
    public let tableTime: Int
    public let tableCost: Int
}
