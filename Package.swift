// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lib-navigation-ios",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "lib-navigation-ios",
            targets: ["lib-navigation-ios"]),
    ],
//    dependencies: [
//        .package(url: "https://github.com/maplibre/maplibre-navigation-ios.git", from: "3.0.0")
//    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "lib-navigation-ios"),
        .testTarget(
            name: "lib-navigation-iosTests",
            dependencies: ["lib-navigation-ios"]),
    ]
)
