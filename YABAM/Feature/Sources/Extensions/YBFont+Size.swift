import Foundation

extension YBFont {
    var size: CGFloat {
        switch self {
        case .boldHeader1:
            return 34
        case .boldHeader2:
            return 24
        case .boldHeader3:
            return 20
        case .boldHeader4:
            return 18
        case .boldHeader5:
            return 16
        case .mediumBody1:
            return 16
        case .boldBody1:
            return 16
        case .regularBody2:
            return 14
        case .mediumBody2:
            return 14
        case .boldBody2:
            return 14
        case .regularBody3:
            return 12
        case .mediumBody3:
            return 12
        case .boldBody3:
            return 12
        }
    }
}
