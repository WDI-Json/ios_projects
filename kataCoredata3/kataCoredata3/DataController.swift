//
//  DataController.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Smoothies")
    
    init () {
        container.loadPersistentStores {description, error in
            if let error = error {
                print("Error while loading CoreData: \(error.localizedDescription)")
            }
        }
    }
}
