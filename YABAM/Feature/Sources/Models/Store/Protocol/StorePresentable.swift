protocol StorePresentable {
    var storeTitle: String { get }
    var storeDescription: String { get }
    var isOpen: Bool { get }
    var reviewCount: Int { get }
    var reviewAverage: Double { get }
}
