// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-position-primitives",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Position Primitives",
            targets: ["Position Primitives"]
        ),
        .library(
            name: "Position Primitives Test Support",
            targets: ["Position Primitives Test Support"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Position Primitives"
        ),
        .target(
            name: "Position Primitives Test Support",
            dependencies: [
                "Position Primitives"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Positioning Primitives Tests",
            dependencies: [
                "Position Primitives",
                "Position Primitives Test Support",
            ],
            path: "Tests/Position Primitives Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
