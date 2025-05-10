enum StoreDetailTab: CaseIterable {
    case menu, review, location

    var title: String {
        switch self {
        case .menu: return "메뉴"
        case .review: return "리뷰"
        case .location: return "위치보기"
        }
    }
}
