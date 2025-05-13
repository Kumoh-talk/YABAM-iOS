public protocol ReceiptServiceInterface {
    func createReceipt(queryStoreId: Int, queryTableId: Int) async throws
    func fetchReceiptId(tableId: Int) async throws -> Int?
    func fetchReceiptList(customerId: Int, pageSize: Int, lastReceiptId: Int?) async throws -> ReceiptListResponseDto
    func fetchReceiptDetail(receiptId: Int) async throws -> ReceiptDetailDto
}

public final class ReceiptService: ReceiptServiceInterface {
    private let provider: YBProvider<ReceiptAPI>
    
    public init(provider: YBProvider<ReceiptAPI> = YBProvider<ReceiptAPI>()) {
        self.provider = provider
    }
    
    public func createReceipt(queryStoreId: Int, queryTableId: Int) async throws {
        try await provider.requestDecodable(
            .createReceipt(queryStoreId: queryStoreId, queryTableId: queryTableId),
            as: EmptyDecodable.self
        )
    }
    
    public func fetchReceiptId(tableId: Int) async throws -> Int? {
        try await provider.requestDecodable(
            .fetchReceiptId(tableId: tableId),
            as: ReceiptIdDto.self
        ).receiptId
    }
    
    public func fetchReceiptList(customerId: Int, pageSize: Int, lastReceiptId: Int?) async throws -> ReceiptListResponseDto {
        try await provider.requestDecodable(
            .fetchReceiptList(customerId: customerId, pageSize: pageSize, lastReceiptId: lastReceiptId),
            as: ReceiptListResponseDto.self
        )
    }
    
    public func fetchReceiptDetail(receiptId: Int) async throws -> ReceiptDetailDto {
        try await provider.requestDecodable(
            .fetchReceiptDetail(receiptId: receiptId),
            as: ReceiptDetailDto.self
        )
    }
}
