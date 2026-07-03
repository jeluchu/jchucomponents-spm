// swift-tools-version: 6.1

import PackageDescription

let package = Package(
    name: "JchuComponents",
    platforms: [
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
        .package(url: "https://github.com/RevenueCat/purchases-ios.git", from: "5.77.0")
    ],
    targets: [
        .binaryTarget(
            name: "JchuComponentsCore",
            url: "https://github.com/Jeluchu/jchucomponents/releases/download/3.0.0-alpha06/JchuComponentsCore.xcframework.zip",
            checksum: "3b6bf97831caf996e4a91f55286c3f448e963201c6d6b271c68987abf62cf61e"
        ),
        .target(
            name: "JchuComponentsExtensions"
        ),
        .target(
            name: "JchuComponentsSwiftUI",
            dependencies: [
                "JchuComponentsCore",
                "JchuComponentsExtensions"
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
