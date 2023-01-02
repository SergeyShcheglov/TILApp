//
//  File.swift
//  
//
//  Created by Sergey Shcheglov on 02.01.2023.
//

@testable import App
import XCTVapor
final class UserTests: XCTestCase {
    let usersName: String = "Alice"
    let usersUsername: String = "alice"
    let usersURI = "/api/users"
    var app: Application!
    
    override func setUpWithError() throws {
        app = try Application.testable()
    }
    
    override func tearDownWithError() throws {
        app.shutdown()
    }
    
    func testUsersCanBeRetrievedFromAPI() throws {
        let user = try User.create(
            name: usersName,
            username: usersUsername,
            on: app.db)
        
        _ = try User.create(on: app.db)

        
        try app.test(.GET, "/api/users", afterResponse: { response in
            XCTAssertEqual(response.status, .ok)
            let users = try response.content.decode([User].self)
            
            XCTAssertEqual(users.count, 2)
            XCTAssertEqual(users[0].name, usersName)
            XCTAssertEqual(users[0].username, usersUsername)
            XCTAssertEqual(users[0].id, user.id)
        }) }
}
