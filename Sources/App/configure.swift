import Fluent
import FluentMongoDriver
import Vapor
// configures your application
public func configure(_ app: Application) throws {
  // 2
  try app.databases.use(.mongo(
    connectionString: "mongodb://localhost:27017/vapor"),
    as: .mongo)
  app.migrations.add(CreateAcronym())
  app.logger.logLevel = .debug
  try app.autoMigrate().wait()
  // register routes
  try routes(app)
}
