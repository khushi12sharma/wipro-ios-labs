
 // swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Lab10A",
    products: [
        .library(
            name: "Lab10A",
            targets: ["Lab10A"]
        )
    ],
    targets: [
        .target(
            name: "Lab10A"
        ),
        .testTarget(
            name: "Lab10ATests",
            dependencies: ["Lab10A"]
        )
    ]
)
