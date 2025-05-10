import ProjectDescription

// MARK: Core

extension TargetDependency {
    public static func core()-> TargetDependency {
        .project(target: "Core", path: .relativeToRoot("YABAM/Core"))
    }
}

// MARK: Network

extension TargetDependency {
    public static func network()-> TargetDependency {
        .project(target: "Network", path: .relativeToRoot("YABAM/Network"))
    }
}

// MARK: Presentation

extension TargetDependency {
    public static func feature()-> TargetDependency {
        .project(target: "Feature", path: .relativeToRoot("YABAM/Feature"))
    }
}
