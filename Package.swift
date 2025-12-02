// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "Connect4",
    products: [
        .library(
            name: "Connect4",
            targets: ["Connect4"]
        ),
    ],
    targets: [
        .target(
            name: "Connect4"
        ),
        .testTarget(
            name: "Connect4Tests",
            dependencies: ["Connect4"]
        ),
    ]
)
