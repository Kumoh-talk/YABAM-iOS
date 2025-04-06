import ProjectDescription

let project = Project(
    name: "YABAM",
    targets: [
        .target(
            name: "YABAM",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.YABAM",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["YABAM/Sources/**"],
            resources: ["YABAM/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "YABAMTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.YABAMTests",
            infoPlist: .default,
            sources: ["YABAM/Tests/**"],
            resources: [],
            dependencies: [.target(name: "YABAM")]
        ),
    ]
)
