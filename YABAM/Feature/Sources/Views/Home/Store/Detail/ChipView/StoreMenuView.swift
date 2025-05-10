import SwiftUI

struct StoreMenuView: View {
    let store: Store
    let menuSections: [MenuSection]
    
    var body: some View {
        MenuSectionList(
            sections: menuSections,
            isNavigationEnabled: false,
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

    /// 스토어 메뉴 보기에서는 실제 카트 기능을 사용하지 않으므로
    /// 카트 조작 메서드를 빈 구현으로 오버라이드합니다.
    override func add(_ item: MenuItem) { }
    override func merge(_ newItems: [MenuItem]) { }
    override func remove(_ item: MenuItem) { }
    override func clear() { }
}
