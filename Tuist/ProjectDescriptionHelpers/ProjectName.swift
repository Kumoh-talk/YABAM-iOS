import ProjectDescription

public enum YBModule: String {
    case App
    case Core
    case Feature
    case Network
}

extension YBModule: CaseIterable {}
