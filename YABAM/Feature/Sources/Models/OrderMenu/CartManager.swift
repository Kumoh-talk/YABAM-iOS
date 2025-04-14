import Combine

final class CartManager: ObservableObject {
    @Published private(set) var items: [MenuItem] = []
    
    var hasItems: Bool {
        !items.isEmpty
    }
    
    func add(_ item: MenuItem) {
        items.append(item)
    }

    func remove(_ item: MenuItem) {
        items.removeAll { $0.id == item.id }
    }

    func clear() {
        items.removeAll()
    }
}
