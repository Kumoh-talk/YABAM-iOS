public struct ReviewRequestDTO: Sendable, Encodable {
    let receiptId: Int
    let storeId: Int
    let content: String
    let rating: Int
    let reviewInfo: ReviewInfo

    struct ReviewInfo: Encodable {
        let content: String
        let rating: Int
    }
}
