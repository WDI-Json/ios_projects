//
//  ToDo.swift
//  KataCoreData1
//
//  Created by Wouter on 11/06/2022.
//

import Foundation

struct Todo: Identifiable {
    let id: UUID
    let title: String
    let isCompleted: Bool
}
