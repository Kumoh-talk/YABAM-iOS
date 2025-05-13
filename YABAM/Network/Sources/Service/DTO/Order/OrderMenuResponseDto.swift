public struct OrderMenuResponseDto: Decodable {
    public let orderMenuId: Int
    public let orderMenuStatus: OrderMenuStatus
    public let quantity: Int
    public let menuInfo: MenuInfoResponseDto
}
