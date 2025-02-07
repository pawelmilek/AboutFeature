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
                "AboutPresentation",
                "AboutDomain",
                "AboutData"
            ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AboutPresentation",
            dependencies: [
                "AboutDomain"
            ]        
        ),
        .target(
            name: "AboutDomain"
        ),
        .target(
            name: "AboutData",
            dependencies: [
                "AboutDomain"
            ],
            resources: [
                .copy("Resources/released_devices.json")
            ]
        ),
        .testTarget(
            name: "AboutFeatureTests",
            dependencies: [
                "AboutPresentation",
                "AboutDomain",
                "AboutData"
            ],
            resources: [
                .copy("Resources/released_devices.json"),
                .copy("Resources/template_app_resources.json")
            ]
        ),
    ]
)
