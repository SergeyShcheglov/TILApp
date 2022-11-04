import Fluent
import FluentMySQLDriver
import Vapor
// configures your application
public func configure(_ app: Application) throws {
    app.databases.use(.mysql(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        username: Environment.get("DATABASE_USERNAME")
        ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD")
        ?? "vapor_password",
        database: Environment.get("DATABASE_NAME")
        ?? "vapor_database",
        tlsConfiguration: .forClient(certificateVerification: .none)
    ), as: .mysql)
    app.migrations.add(CreateAcronym())
    app.logger.logLevel = .debug
    try app.autoMigrate().wait()
    // register routes
    try routes(app)
}
