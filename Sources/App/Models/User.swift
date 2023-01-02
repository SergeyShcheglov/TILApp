//
//  File.swift
//  
//
//  Created by Sergey Shcheglov on 01.01.2023.
//

import Fluent
import Vapor

final class User: Model, Content {
    static let schema: String = "users"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "username")
    var username: String
    
    @Children(for: \.$user)
    var acronyms: [Acronym]
    
    init() { }
    
    init(id: UUID? = nil, name: String, username: String) {
        self.name = name
        self.username = username
    }
}
