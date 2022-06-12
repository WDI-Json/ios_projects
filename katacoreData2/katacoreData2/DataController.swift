//
//  DataController.swift
//  katacoreData2
//
//  Created by Wouter on 12/06/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    //initialiseren NSPersistentContainer. CoreData gets prepped not loaded!
    let container = NSPersistentContainer(name: "Bookwurm")
    
    init() {
        //NOW coredata gets loaded and initialized. 
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
