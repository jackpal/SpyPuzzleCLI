// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpyPuzzleCLI",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/jackpal/SpyPuzzleGameState", from: "0.1.0"),
        .package(url: "https://github.com/jackpal/SpyPuzzleSolver", from: "0.1.0"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "SpyPuzzleCLI",
            dependencies: [
                "SpyPuzzleGameState",
                "SpyPuzzleSolver",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]),
        .testTarget(
            name: "SpyPuzzleCLITests",
            dependencies: ["SpyPuzzleCLI"]),
    ]
)
