public struct ReceiptIdDto: Decodable, Sendable {
    public let receiptId: Int
    
    public init(receiptId: Int) {
        self.receiptId = receiptId
    }
}
