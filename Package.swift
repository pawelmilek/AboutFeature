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
                "AboutFeatureUI",
                "AboutFeatureDomain",
                "AboutFeatureData"
            ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AboutFeatureUI",
            dependencies: [
                "AboutFeatureDomain"
            ]        
        ),
        .target(
            name: "AboutFeatureDomain"
        ),
        .target(
            name: "AboutFeatureData",
            dependencies: [
                "AboutFeatureDomain"
            ],
            resources: [
                .copy("Resources/device_types.json"),
                .copy("Resources/app_network_resources.json"),
                .copy("Resources/packages_license.html")
            ]
        ),
        .testTarget(
            name: "AboutFeatureTests",
            dependencies: [
                "AboutFeatureUI",
                "AboutFeatureDomain",
                "AboutFeatureData"
            ],
            resources: [
                .copy("Resources/device_types.json"),
                .copy("Resources/app_network_resources.json"),
                .copy("Resources/packages_license.html")
            ]
        ),
    ]
)
