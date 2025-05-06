extension YBFont {
    var name: String {
        switch self {
        case .boldHeader1,
                .boldHeader2,
                .boldHeader3,
                .boldHeader4,
                .boldHeader5,
                .boldBody1,
                .boldBody2,
                .boldBody3:
            return FeatureFontFamily.Pretendard.bold.name
            
        case .mediumHeader1,
                .mediumHeader2,
                .mediumHeader3,
                .mediumHeader4,
                .mediumHeader5,
                .mediumBody1,
                .mediumBody2,
                .mediumBody3:
            return FeatureFontFamily.Pretendard.medium.name
            
        case .regularBody2,
                .regularBody3:
            return FeatureFontFamily.Pretendard.regular.name
        }
    }
}
