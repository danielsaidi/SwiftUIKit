// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "SwiftUIKit",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftUIKit",
            targets: ["SwiftUIKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
        .package(url: "https://github.com/danielsaidi/MockingKit.git", .upToNextMajor(from: "0.9.0"))
    ],
    targets: [
        .target(
            name: "SwiftUIKit",
            dependencies: []),
        .testTarget(
            name: "SwiftUIKitTests",
            dependencies: ["SwiftUIKit", "Quick", "Nimble", "MockingKit"])
    ]
)
