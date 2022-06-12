//
//  GetTodos.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

enum UseCaseError: Error {
    case networkError, decodingError
}

protocol getTodos{
    
    func execute() async -> Result<[Todo], UseCaseError>

}

struct GetTodosUseCase: getTodos {
    
    var repo: TodoRepository
    
    func execute() async -> Result<[Todo], UseCaseError> {
        do {
            let todos = try await repo.getTodos()
            return .success(todos)
        } catch(let error) {
            switch error {
            case APIserviceError.decodingError:
                return .failure(.decodingError)
            default:
                return .failure(.networkError)
            }
        }
    }
}
