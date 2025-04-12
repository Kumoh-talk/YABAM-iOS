import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Target

let appTarget = Target.target(
    name: "App",
    product: .app,
    bundleId: Project.bundleID,
    infoPlist: .file(path: .relativeToRoot("YABAM/App/SupportingFiles/Info.plist")),
    sources: .sources,
    resources: [
        .glob(pattern: .relativeToRoot("YABAM/App/Resources/**")),
        .glob(pattern: .relativeToRoot("YABAM/App/Resources/LaunchScreen.storyboard"))
    ],
    dependencies: [
        // Module
        .core(),
        .feature(),
        .network()
    ],
    settings: .settings(
        base: [
            "DEVELOPMENT_LANGUAGE": "ko",
            "SWIFT_VERSION": "6.0",
        ],
        configurations: [
            .debug(name: "Debug", xcconfig: "SupportingFiles/Debug.xcconfig"),
            .release(name: "Release", xcconfig: "SupportingFiles/Release.xcconfig")
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
