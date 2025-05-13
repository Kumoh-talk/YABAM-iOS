import Foundation

public struct ReceiptDetailDto: Decodable {
    public let receiptId: Int
    public let isAdjustment: Bool
    public let startUsageTime: String
    public let stopUsageTime: String
    public let occupancyFee: Int
    
    public init(
        receiptId: Int,
        isAdjustment: Bool,
        startUsageTime: String,
        stopUsageTime: String,
        occupancyFee: Int
    ) {
        self.receiptId = receiptId
        self.isAdjustment = isAdjustment
        self.startUsageTime = startUsageTime
        self.stopUsageTime = stopUsageTime
        self.occupancyFee = occupancyFee
    }
}
