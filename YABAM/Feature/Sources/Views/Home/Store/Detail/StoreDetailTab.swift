enum StoreDetailTab: CaseIterable {
    case info, menu, review, location

    var title: String {
        switch self {
        case .info: return "가게정보"
        case .menu: return "메뉴"
        case .review: return "리뷰"
        case .location: return "위치보기"
        }
    }
}
