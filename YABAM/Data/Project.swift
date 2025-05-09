import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: YBModule.YBData.rawValue,
    targets: [
        Target.target(
            name: YBModule.YBData.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".data",
            sources: .sources,
            dependencies: [
                // Module
                .core(),
            ]
        )
    ]
)
