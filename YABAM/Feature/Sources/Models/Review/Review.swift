struct Review: Identifiable, Hashable {
    let id: Int
    let userNickname: String
    let rating: Double
    let content: String
}
