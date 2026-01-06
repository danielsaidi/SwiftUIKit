// swift-tools-version:6.1.0
import PackageDescription

let package = Package(
  name: "StringCatalogKeyBuilder",
  platforms: [
    .iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .visionOS(.v1)
  ],
  products: [
    .executable(
      name: "l10n-gen",
      targets: ["StringCatalogKeyBuilder"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      .upToNextMajor(from: "1.5.0")
    ),
  ],
  targets: [
    .executableTarget(
      name: "StringCatalogKeyBuilder",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    )
  ]
)
