//
//  File.swift
//  
//
//  Created by Sergey Shcheglov on 02.01.2023.
//

import Fluent

struct CreateAcronymCategoryPivot: Migration {
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("acronym-category-pivot")
            .id()
            .field("acronymID", .uuid, .required,
                   .references("acronyms", "id", onDelete: .cascade))
            .field("categoryID", .uuid, .required,
                   .references("categories", "id", onDelete: .cascade))
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("acronym-category-pivot").delete()
    }
    
    
}
