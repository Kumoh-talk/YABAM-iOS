public struct MenuInfoResponseDto: Decodable {
    public let menuId: Int
    public let menuOrder: Int
    public let menuName: String
    public let menuPrice: Int
    public let menuDescription: String
    public let menuImageUrl: String
    public let menuIsSoldOut: Bool
    public let menuIsRecommended: Bool
}
