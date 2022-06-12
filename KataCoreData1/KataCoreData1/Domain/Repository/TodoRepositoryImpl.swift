//
//  TodoRepositoryImpl.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

struct TodoRepositoryImpl: TodoRepository {
    
    var dataSource: ToDoDataSource
    
    func getTodos() async throws -> [Todo] {
        let todos = try await dataSource.getTodos()
        return todos
    }
    
}
