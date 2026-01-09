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
        .package(path: "../swift-test-support-primitives"),
    ],
    targets: [
        .target(
            name: "Positioning Primitives"
        ),
        .testTarget(
            name: "Positioning Primitives Tests",
            dependencies: [
                "Positioning Primitives",
                .product(name: "Test Support Primitives", package: "swift-test-support-primitives"),
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)
