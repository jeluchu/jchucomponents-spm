// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "JchuComponents",
    platforms: [
        .macOS(.v10_15),
        .iOS("26.0")
    ],
    products: [
        .library(
            name: "JchuComponents",
            targets: [
                "JchuComponentsCore",
                "JchuComponentsExtensions",
                "JchuComponentsSwiftUI"
            ]
        ),
        .library(
            name: "JchuComponentsPay",
            targets: ["JchuComponentsPay"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher.git", from: "8.0.0"),
        .package(url: "https://github.com/RevenueCat/purchases-ios.git", from: "5.77.0")
    ],
    targets: [
        .binaryTarget(
            name: "JchuComponentsCore",
            url: "https://github.com/Jeluchu/jchucomponents/releases/download/3.0.0-alpha07/JchuComponentsCore.xcframework.zip",
            checksum: "8230426431e7cea276fb1ae5cbae819c67e3b679cc57d3a00c129699fe731b29"
        ),
        .target(
            name: "JchuComponentsExtensions"
        ),
        .target(
            name: "JchuComponentsSwiftUI",
            dependencies: [
                "JchuComponentsCore",
                "JchuComponentsExtensions",
                .product(name: "Kingfisher", package: "Kingfisher")
            ]
        ),
        .target(
            name: "JchuComponentsPay",
            dependencies: [
                .product(name: "RevenueCat", package: "purchases-ios")
            ]
        ),
        .testTarget(
            name: "JchuComponentsSwiftUITests",
            dependencies: [
                "JchuComponentsCore",
                "JchuComponentsExtensions",
                "JchuComponentsSwiftUI"
            ]
        )
    ]
)
