// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Tyler.Style",
    products: [
        .library(name: "Tyler.Style", targets: ["Style"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IgorMuzyka/Tyler.Variable", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Tyler.Tag", .branch("master")),
        .package(url: "https://github.com/IgorMuzyka/Type-Preserving-Coding-Adapter", .branch("master")),
    ],
    targets: [
        .target(name: "Style", dependencies: [
            "Tyler.Variable",
            "Tyler.Tag",
            "TypePreservingCodingAdapter",
        ]),
    ]
)
