// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DangerSwiftCoverage",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "DangerSwiftCoverage",
            targets: ["DangerSwiftCoverage"]
        ),
        .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"]), // dev
    ],
    dependencies: [
        .package(url: "https://github.com/danger/swift.git", from: "3.18.1"),
        // Dev dependencies
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8"), // dev
        .package(url: "https://github.com/f-meloni/danger-swift-xcodesummary", from: "1.0.0"), // dev
    ],
    targets: [
        .target(name: "DangerDependencies", dependencies: ["Danger", "DangerSwiftCoverage", "DangerXCodeSummary"]), // dev
        .target(
            name: "DangerSwiftCoverage",
            dependencies: ["Danger"]
        ),
        .testTarget(
            name: "DangerSwiftCoverageTests",
            dependencies: ["DangerSwiftCoverage", "DangerFixtures"]
        ),
    ]
)
