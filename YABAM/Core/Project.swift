import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: YBModule.Core.rawValue,
    targets: [
        Target.target(
            name: YBModule.Core.rawValue,
            product: .framework,
            bundleId: Project.bundleID + ".core",
            sources: .sources,
            dependencies: [
                // Third Party Library
                .external(dependency: .KeyChainManager)
            ]
        )
    ]
)
