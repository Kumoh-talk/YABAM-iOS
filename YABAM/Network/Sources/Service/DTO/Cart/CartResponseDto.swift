public struct CartResponseDto: Decodable {
    public let receiptId: Int
    public let cartMenuDtos: [CartMenuDto]
}
