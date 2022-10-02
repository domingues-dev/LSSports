// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LSSports",
  platforms: [.iOS(.v16)],
  products: [
    .library(name: "LSModels", targets: ["LSModels"]),
    .library(name: "SportsRouter", targets: ["SportsRouter"])
  ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-url-routing", from: "0.3.1")
  ],
  targets: [
    .target(
      name: "LSModels",
      dependencies: [
      ],
      resources: [
      ]
    ),
    .target(
      name: "SportsRouter",
      dependencies: [
        "LSModels",
        .product(name: "URLRouting", package: "swift-url-routing")
      ],
      resources: [
        .process("Resources")
      ]
    )
  ]
)
