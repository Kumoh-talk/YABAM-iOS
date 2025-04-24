import Combine

final class CartManager: ObservableObject {
    @Published private(set) var items: [MenuItem] = []
    
    var hasItems: Bool {
        !items.isEmpty
    }
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ item: MenuItem) {
        items.append(item)
    }
    
    func merge(_ newItems: [MenuItem]) {
        items.append(contentsOf: newItems)
    }

    func remove(_ item: MenuItem) {
        items.removeAll { $0.id == item.id }
    }

    func clear() {
        items.removeAll()
    }
}
