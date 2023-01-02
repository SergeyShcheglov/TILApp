//
//  File.swift
//  
//
//  Created by Sergey Shcheglov on 02.01.2023.
//

import Fluent

struct CreateCategory: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("categories")
            .id()
            .field("name", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("categories").delete()
    }
    
    
}
