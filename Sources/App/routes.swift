import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    let acronymsController = AcronymsController()
    try app.register(collection: acronymsController)
    
    let userController = UserController()
    try app.register(collection: userController)
    
    let categoryController = CategoryController()
    try app.register(collection: categoryController)
}
