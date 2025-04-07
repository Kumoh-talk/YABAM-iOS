import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Target

let appTarget = Target.target(
    name: "App",
    product: .app,
    bundleId: Project.bundleID,
    sources: .sources,
    resources: [
        .glob(pattern: .relativeToRoot("YABAM/App/Resources/**"))
    ],
    dependencies: [
        // Module
    ],
    settings: .settings(
        base: [
            "DEVELOPMENT_LANGUAGE": "ko"
        ]
    )
)

// MARK: - Project

let project = Project.project(
    name: "App",
    targets: [
        appTarget,
    ]
)
