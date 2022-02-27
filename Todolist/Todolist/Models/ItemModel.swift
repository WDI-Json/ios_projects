//
//  ItemModel.swift
//  Todolist
//
//  Created by Wouter on 27/02/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
