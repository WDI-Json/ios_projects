//
//  TodoDataSource.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

protocol ToDoDataSource {
    
    func getTodos() async throws -> [Todo]
    
}
