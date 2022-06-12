//
//  TodoCoreDataSourceImpl.swift
//  KataCoreData1
//
//  Created by Wouter on 12/06/2022.
//

import Foundation
import CoreData

class TodoCoreDataSourceImpl: TodoDataSource {
    
    let container = NSPersistentContainer(name: "main")
    
    init() {
        container.loadPersistentStores {description, error in
            if error != nil {
                fatalError("Cannot Load Core Data Model")
            }
        }
    }
    
    func getAll() throws -> [Todo]{
        let request = TodoCoreDataEntity.fetchRequest()
        return try container.viewContext.fetch(request).map({ todoCoreDataEntity in
            Todo(
                id: todoCoreDataEntity.id!,
                title: todoCoreDataEntity.title!,
                isCompleted: todoCoreDataEntity.is_completed
            )
        })
        
    }
    
    func getById(_ id: UUID)  throws  -> Todo?{
        let todoCoreDataEntity = try getEntityById(id)!
        return Todo(
            id: todoCoreDataEntity.id!,
            title: todoCoreDataEntity.title!,
            isCompleted: todoCoreDataEntity.is_completed
        )
        
    }
    
    func delete(_ id: UUID) throws -> (){
        let todoCoreDataEntity = try getEntityById(id)!
        let context = container.viewContext;
        context.delete(todoCoreDataEntity)
        do{
            try context.save()
        }catch{
            context.rollback()
            fatalError("Error: \(error.localizedDescription)")
        }
        
    }
    
    func update(id: UUID, todo: Todo) throws -> (){
        let todoCoreDataEntity = try getEntityById(id)!
        todoCoreDataEntity.is_completed = todo.isCompleted
        todoCoreDataEntity.title = todo.title
        saveContext()
    }
    
    func create(todo: Todo) throws -> (){
        let todoCoreDataEntity = TodoCoreDataEntity(context: container.viewContext)
        todoCoreDataEntity.is_completed = todo.isCompleted
        todoCoreDataEntity.title = todo.title
        todoCoreDataEntity.id = UUID()
        saveContext()
    }
    
    
    private func getEntityById(_ id: UUID)  throws  -> TodoCoreDataEntity?{
        let request = TodoCoreDataEntity.fetchRequest()
        request.fetchLimit = 1
        request.predicate = NSPredicate(
            format: "id = %@", id.uuidString)
        let context =  container.viewContext
        let todoCoreDataEntity = try context.fetch(request)[0]
        return todoCoreDataEntity
        
    }
    
    private func saveContext(){
        let context = container.viewContext
        if context.hasChanges {
            do{
                try context.save()
            }catch{
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
}
