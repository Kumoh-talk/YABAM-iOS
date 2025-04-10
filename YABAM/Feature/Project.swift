import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: YBModule.Feature.rawValue,
    targets: [
        Target.target(
            name: YBModule.Feature.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".feature",
            sources: .sources,
            resources: .default,
            dependencies: [
                .core(),
                .external(dependency: .CodeScanner)
            ]
        )
    ]
)
