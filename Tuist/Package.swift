// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "Moya": .framework,
            "CodeScanner": .framework,
        ]
    )
#endif

let package = Package(
    name: "YABAM",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya", from: "15.0.3"),
        .package(url: "https://github.com/twostraws/CodeScanner.git", from: "2.5.2")
    ]
)
