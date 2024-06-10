// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DangerSwiftCoverage",
    products: [
        .library(name: "DangerSwiftCoverage",targets: ["DangerSwiftCoverage"]),
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]),
        .library(name: "DangerSwiftlint", targets: ["DangerSwiftlint"]),
        .library(name: "DangerXCodeSummary", targets: ["DangerXCodeSummary"]),
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.18.1"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8")
    ],
    targets: [
        .target(name: "DangerDependencies",
                dependencies: ["Danger", "DangerSwiftCoverage", "DangerXCodeSummary"]),
        .target(name: "DangerSwiftlint",
                dependencies: ["Danger"]),
        .target(name: "DangerSwiftCoverage", dependencies: ["Danger"]),
        .target(name: "DangerXCodeSummary", dependencies: ["Danger"]),
        .testTarget(
            name: "DangerSwiftCoverageTests",
            dependencies: ["DangerSwiftCoverage", "DangerFixtures", "DangerXCodeSummary", "DangerSwiftlint"]
        ),
    ]
)
