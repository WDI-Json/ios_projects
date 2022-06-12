//
//  TodoDataSource.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

protocol TodoDataSource{
    func getAll() async throws -> [Todo]
    func getById(_ id: UUID) async throws -> Todo?
    func delete(_ id: UUID) async throws -> ()
    func create(todo: Todo) async throws -> ()
    func update(id: UUID, todo: Todo) async throws -> ()
}
