//
//  kataCoredata3App.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

@main
struct kataCoredata3App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
