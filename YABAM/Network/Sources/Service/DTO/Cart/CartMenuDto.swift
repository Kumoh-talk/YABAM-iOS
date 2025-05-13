public struct CartMenuDto: Decodable {
    public let quantity: Int
    public let menuId: Int
    public let order: Int
    public let name: String
    public let price: Int
    public let description: String
    public let imageUrl: String
    public let isSoldOut: Bool
    public let isRecommended: Bool
}
