//
//  TodoRepositoryImpl.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

protocol TodoRepository {
    
    func getTodos() async throws -> [Todo]
    
}
