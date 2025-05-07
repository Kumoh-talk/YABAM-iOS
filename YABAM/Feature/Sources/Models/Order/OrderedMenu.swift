import Foundation

struct OrderedMenu: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let quantity: Int
    // 추가적으로 옵션, 가격 등 필요한 항목도 확장 가능
}
