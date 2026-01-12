// swift-tools-version: 6.2

import PackageDescription

let package = Package(
    name: "swift-positioning-primitives",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(
            name: "Positioning Primitives",
            targets: ["Positioning Primitives"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-test-primitives.git", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "Positioning Primitives"
        ),
        .testTarget(
            name: "Positioning Primitives Tests",
            dependencies: [
                "Positioning Primitives",
                .product(name: "Test Primitives", package: "swift-test-primitives"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
