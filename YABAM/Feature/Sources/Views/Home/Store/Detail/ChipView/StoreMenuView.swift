import SwiftUI

struct StoreMenuView: View {
    let store: Store
    
    @State private var menuSections: [MenuSection] = MenuSectionSampleData.menuSections
    
    var body: some View {
        MenuSectionList(
            sections: menuSections,
            selectedSectionID: .constant(nil),
            cartManager: DummyCartManager.shared
        )
        .frame(maxWidth: .infinity)
    }
}

final class DummyCartManager: CartManager {
    static let shared = DummyCartManager()

    private override init() {
        super.init()
    }

    override func add(_ item: MenuItem) { }
    override func merge(_ newItems: [MenuItem]) { }
    override func remove(_ item: MenuItem) { }
    override func clear() { }
}
