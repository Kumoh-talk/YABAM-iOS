public struct OrderAndMenusResponseDto: Decodable {
    public let orderId: Int
    public let orderStatus: OrderStatus
    public let totalPrice: Int
    public let orderMenus: [OrderMenuResponseDto]
}
