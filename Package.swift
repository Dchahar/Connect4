// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Connect4",
    platforms: [.iOS(.v18)],
    products: [
        .library(
            name: "Connect4",
            targets: ["Connect4"]
        ),
        .executable(
            name: "Connect4Game",
            targets: ["Connect4Game"]
        )
    ],
    targets: [
        .target(
            name: "Connect4"
        ),
        .executableTarget(
            name: "Connect4Game",
            dependencies: ["Connect4"]
        ),
        .testTarget(
            name: "Connect4Tests",
            dependencies: ["Connect4"]
        )
    ]
)
