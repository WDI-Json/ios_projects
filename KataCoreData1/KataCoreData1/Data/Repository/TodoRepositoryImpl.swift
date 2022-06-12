//
//  TodoRepositoryImpl.swift
//  KataCoreData1
//
//  Created by Wouter on 12/06/2022.
//

import Foundation

struct TodoRepositoryImpl: TodoRepository{
       
    var dataSource: TodoDataSource
    
    func getTodo(id: UUID) async  -> Result<Todo?, TodoError> {
        do{
            let _todo =  try await dataSource.getById(id)
            return .success(_todo)
        }catch{
            return .failure(.FetchError)
        }

    }
    
    func deleteTodo(_ id: UUID) async ->  Result<Bool, TodoError>  {
        do{
            try await dataSource.delete(id)
            return .success(true)
        }catch{
            return .failure(.DeleteError)
        }

    }
    
    func createTodo(_ todo: Todo) async ->  Result<Bool, TodoError>   {
        do{
            try await dataSource.create(todo: todo)
            return .success(true)
        }catch{
            return .failure(.CreateError)
        }

    }
    
    func updateTodo(_ todo: Todo) async ->  Result<Bool, TodoError>   {
        do{
            try await dataSource.update(id: todo.id, todo:todo)
            return .success(true)
        }catch{
            return .failure(.UpdateError)
        }

    }
    
    func getTodos() async -> Result<[Todo], TodoError> {
        do{
            let _todos =  try await dataSource.getAll()
            return .success(_todos)
        }catch{
            return .failure(.FetchError)
        }
    }
}
