import Foundation

struct MenuItem: Hashable, Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let price: Int
    let imageName: String
    let isRecommended: Bool
}
