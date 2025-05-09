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
    
    public init(
        storeId: Int,
        isOpen: Bool,
        userId: Int,
        userNickname: String,
        storeName: String,
        latitude: Double,
        longitude: Double,
        description: String,
        headImageUrl: String,
        university: String,
        tableTime: Int,
        tableCost: Int
    ) {
        self.storeId = storeId
        self.isOpen = isOpen
        self.userId = userId
        self.userNickname = userNickname
        self.storeName = storeName
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.headImageUrl = headImageUrl
        self.university = university
        self.tableTime = tableTime
        self.tableCost = tableCost
    }
}
