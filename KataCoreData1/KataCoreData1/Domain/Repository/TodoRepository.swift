//
//  TodoRepository.swift
//  KataCoreData1
//
//  Created by Wouter on 12/06/2022.
//

import Foundation

protocol TodoRepository {
    func getTodos() async -> Result<[Todo], TodoError>
    func getTodo(id: UUID) async -> Result<Todo? , TodoError>
    func deleteTodo(_ id: UUID) async -> Result<Bool, TodoError>
    func createTodo(_ todo: Todo) async -> Result<Bool, TodoError>
    func updateTodo(_ todo: Todo) async -> Result<Bool, TodoError>
}
