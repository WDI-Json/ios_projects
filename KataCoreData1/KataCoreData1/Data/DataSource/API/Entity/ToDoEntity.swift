//
//  ToDoEntity.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

struct TodoAPIEntity: Codable {
    let id: Int
    let title: String
    let completed: Bool
}
