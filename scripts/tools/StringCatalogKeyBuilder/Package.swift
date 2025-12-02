// swift-tools-version:6.1.0
import PackageDescription

let package = Package(
  name: "StringCatalogKeyBuilder",
  platforms: [
    .macOS(.v13),
  ],
  products: [
    .executable(
      name: "l10n-gen",
      targets: ["StringCatalogKeyBuilder"]
    ),
  ],
  dependencies: [
    .package(
      name: "SwiftPackageScripts",
      path: "../../../"
    ),
    .package(
      url: "https://github.com/apple/swift-argument-parser.git",
      .upToNextMajor(from: "1.5.0")
    ),
  ],
  targets: [
    .executableTarget(
      name: "StringCatalogKeyBuilder",
      dependencies: [
        "SwiftPackageScripts",
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
      ]
    )
  ]
)
