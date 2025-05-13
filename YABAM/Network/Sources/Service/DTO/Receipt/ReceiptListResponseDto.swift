import Foundation

public struct ReceiptListResponseDto: Decodable {
    public let nextPage: Bool
    public let pageSize: Int
    public let pageContents: [ReceiptSummaryDto]
}
