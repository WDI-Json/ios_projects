//
//  katacoreData2App.swift
//  katacoreData2
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

@main
struct katacoreData2App: App {
    //Object wordt gemaakt en blijft bestaan zolang de app draait.
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
            //Bestaat enkel in memory nog tot je saved. Geeft toegang tot memory zodat deze snel blijft. Je schrijft alleen wanneer deze klaar is. Je kan dus data opgeven maar niet opslaan (bijvoorbeeld concept)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
