import Foundation

extension YBFont {
    var size: CGFloat {
        switch self {
        case .boldHeader1,
             .mediumHeader1:
            return 30
        case .boldHeader2,
             .mediumHeader2:
            return 24
        case .boldHeader3,
             .mediumHeader3:
            return 20
        case .boldHeader4,
             .mediumHeader4:
            return 18
        case .boldHeader5,
             .mediumHeader5:
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
