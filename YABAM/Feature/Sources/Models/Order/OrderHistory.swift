import Foundation

struct OrderHistory: Identifiable, Hashable {
    let id: UUID
    let orderDate: Date
    let storeName: String
    let storeProfileImageUrl: String
    let totalMenuCount: Int
    let totalPrice: Int
    let orderedMenus: [OrderedMenu]
    let canWriteReview: Bool
    let reviewDeadline: Date
}
