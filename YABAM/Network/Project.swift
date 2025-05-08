import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: YBModule.Network.rawValue,
    targets: [
        Target.target(
            name: YBModule.Network.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".network",
            sources: .sources,
            dependencies: [
                .core(),
            ]
        )
    ]
)
