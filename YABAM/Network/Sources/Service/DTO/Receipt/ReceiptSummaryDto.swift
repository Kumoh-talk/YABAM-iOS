import Foundation

public struct ReceiptSummaryDto: Decodable {
    public let receiptId: Int
    public let isAdjustment: Bool
    public let startUsageTime: String
    public let stopUsageTime: String
    public let occupancyFee: Int
}
