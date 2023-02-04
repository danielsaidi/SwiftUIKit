// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "SwiftUIKit",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14),
        .watchOS(.v7),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "SwiftUIKit",
            targets: ["SwiftUIKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUIKit",
            dependencies: []),
        .testTarget(
            name: "SwiftUIKitTests",
            dependencies: ["SwiftUIKit"])
    ]
)
