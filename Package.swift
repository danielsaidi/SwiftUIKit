// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SwiftUIKit",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_15)
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
            dependencies: ["SwiftUIKit"]),
    ]
)
