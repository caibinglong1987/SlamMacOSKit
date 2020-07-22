// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlamMacOSKit",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "SlamMacOSKit",
            targets: ["SlamMacOSKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/magesteve/SlamKit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SlamMacOSKit",
            dependencies: []),
        .testTarget(
            name: "SlamMacOSKitTests",
            dependencies: ["SlamKit", "SlamMacOSKit"]),
    ]
)
