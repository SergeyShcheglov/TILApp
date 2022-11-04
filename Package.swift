// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "TILApp",
  platforms: [
    .macOS(.v12)
  ],
  dependencies: [
    .package(
      url: "https://github.com/vapor/vapor.git",
      from: "4.0.0"),
    .package(
      url: "https://github.com/vapor/fluent.git",
      from: "4.0.0"),
    // 1
    .package(
      url: "https://github.com/vapor/fluent-mongo-driver.git",
      from: "1.0.0")
], targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Fluent", package: "fluent"),
        // 2
        .product(
          name: "FluentMongoDriver",
          package: "fluent-mongo-driver"),
        .product(name: "Vapor", package: "vapor")
             ],
             swiftSettings: [
               .unsafeFlags(
                 ["-cross-module-optimization"],
                 .when(configuration: .release))
             ]
           ),
           .target(name: "Run", dependencies: [.target(name: "App")]),
           .testTarget(name: "AppTests", dependencies: [
             .target(name: "App"),
             .product(name: "XCTVapor", package: "vapor"),
           ])
       ]
)
