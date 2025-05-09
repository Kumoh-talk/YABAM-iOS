// swift-tools-version: 6.0
@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "Alamofire": .framework,
            "CodeScanner": .framework,
            "KeyChainManager": .framework,
        ]
    )
#endif

let package = Package(
    name: "YABAM",
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.10.2")),
        .package(url: "https://github.com/twostraws/CodeScanner.git", from: "2.5.2"),
        .package(url: "https://github.com/Kyxxn/SPM-KeyChainManager-KJ.git", from: "1.0.1"),
    ]
)
