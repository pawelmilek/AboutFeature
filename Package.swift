// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AboutFeature",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AboutFeature",
            targets: [
                "Presentation",
                "Domain",
                "Data"
            ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Presentation",
            dependencies: [
                "Domain"
            ]        
        ),
        .target(
            name: "Domain"
        ),
        .target(
            name: "Data",
            dependencies: [
                "Domain"
            ],
            resources: [
                .copy("Resources/released_devices.json")
            ]
        ),
        .testTarget(
            name: "AboutFeatureTests",
            dependencies: [
                "Presentation",
                "Domain",
                "Data"
            ],
            resources: [
                .copy("Resources/released_devices.json"),
                .copy("Resources/template_app_resources.json")
            ]
        ),
    ]
)
