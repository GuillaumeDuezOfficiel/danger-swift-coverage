import Danger
import DangerSwiftCoverage
import DangerXCodeSummary

let danger = Danger()

let report = XCodeSummary(filePath: "result.json")
report.report()

Coverage.xcodeBuildCoverage(.derivedDataFolder("build"), minimumCoverage: 50, excludedTargets: ["DangerSwiftCoverageTests.xctest"])

/*
 Coverage.xcodeBuildCoverage(.xcresultBundle("/Users/guillaumeduez/Library/Developer/Xcode/DerivedData/danger-swift-coverage-gjqtkbcwtsyodtgrnwkbedvaavvd/Logs/Test/Test-DangerSwiftCoverage-2024.06.10_18-40-25-+0200.xcresult"), minimumCoverage: 99, excludedTargets: ["DangerSwiftCoverageTests.xctest"])
 */
