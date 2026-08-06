// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "SwiftUIKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
        .macOS(.v14),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "SwiftUIKit",
            targets: ["SwiftUIKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftUIKit",
            dependencies: [],
            resources: [.process("Resources")],
            swiftSettings: [
                // Enable library evolution
//                .unsafeFlags(["-enable-library-evolution"]),

                // Additional strict checks
                // .unsafeFlags(["-warnings-as-errors"]),
                // .unsafeFlags(["-strict-concurrency=complete"])
            ]
        ),
        .testTarget(
            name: "SwiftUIKitTests",
            dependencies: ["SwiftUIKit"]
        )
    ]
)
