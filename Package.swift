// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HybridColor",
    platforms: [
        .macOS(.v14), // This line restricts the package to macOS v14 and later.
        .iOS(.v17) // This line restricts the package to iOS v15 and later.
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "HybridColor",
            targets: ["HybridColor"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "HybridColor"),
        .testTarget(
            name: "HybridColorTests",
            dependencies: ["HybridColor"])
    ]
)
