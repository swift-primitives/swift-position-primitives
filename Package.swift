// swift-tools-version: 6.3.3

import PackageDescription

let package = Package(
    name: "swift-position-primitives",
    platforms: [
        .macOS("27"),
        .iOS("27"),
        .tvOS("27"),
        .watchOS("27"),
        .visionOS("27")
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
    dependencies: [
    ],
    targets: [
        .target(
            name: "Position Primitives"
        ),
        .target(
            name: "Position Primitives Test Support",
            dependencies: [
                "Position Primitives",
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
        .enableExperimentalFeature("LifetimeDependence"),
        .enableExperimentalFeature("Lifetimes"),
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableUpcomingFeature("LifetimeDependence"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
