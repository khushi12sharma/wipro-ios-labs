
 // swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Lab10A",
    products: [
        .library(
            name: "CourseLogic",
            targets: ["CourseLogic"]
        )
    ],
    targets: [
        .target(
            name: "CourseLogic",
            path: "Sources/CourseLogic"
        ),
        .testTarget(
            name: "CourseLogicTests",
            dependencies: ["CourseLogic"],
            path: "Tests/CourseLogicTests"
        )
    ]
)
