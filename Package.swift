// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DangerSwiftCoverage",
  products: [
    .library(name: "DangerSwiftCoverage", targets: ["DangerSwiftCoverage",
                                                    "DangerSwiftLint",
                                                    "DangerXCodeSummary"]),
    .library(name: "DangerDeps", type: .dynamic, targets: ["DangerDependencies"])
  ],
  dependencies: [
    .package(url: "https://github.com/danger/swift.git", from: "3.18.1"),
    .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.35.8")
  ],
  targets: [
    .target(name: "DangerSwiftLint",
            dependencies: [.product(name: "Danger", package: "swift")],
            path: "Sources/DangerSwiftLint"),
    .target(name: "DangerSwiftCoverage",
            dependencies: [.product(name: "Danger", package: "swift")],
            path: "Sources/DangerSwiftCoverage"),
    .target(name: "DangerXCodeSummary",
            dependencies: [.product(name: "Danger", package: "swift")],
            path: "Sources/DangerXCodeSummary"),
    .target(name: "DangerDependencies",
            dependencies: [.product(name: "Danger", package: "swift"),
                           "DangerSwiftCoverage",
                           "DangerXCodeSummary"],
            path: "Sources/DangerDependencies"),
    .testTarget(
      name: "DangerSwiftCoverageTests",
      dependencies: ["DangerSwiftLint",
                     "DangerDependencies",
                     "DangerSwiftCoverage",
                     "DangerXCodeSummary",
                     .product(name: "DangerFixtures", package: "swift")],
      path: "Tests/DangerSwiftCoverageTests",
      resources: [
        .process("Json/")
      ]
    ),
  ]
)
