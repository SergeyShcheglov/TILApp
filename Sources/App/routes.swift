import Fluent
import Vapor

func routes(_ app: Application) throws {
    let acronymsController = AcronymsController()
    try app.register(collection: acronymsController)
    
    let userController = UserController()
    try app.register(collection: userController)
}
