//
//  File.swift
//  
//
//  Created by Sergey Shcheglov on 02.01.2023.
//

import Fluent
import Vapor

final class Category: Content, Model {
    static let schema = "categories"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
