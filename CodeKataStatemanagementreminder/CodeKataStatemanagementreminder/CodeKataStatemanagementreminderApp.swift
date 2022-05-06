//
//  CodeKataStatemanagementreminderApp.swift
//  CodeKataStatemanagementreminder
//
//  Created by Wouter on 04/05/2022.
//

import SwiftUI

@main
struct CodeKataStatemanagementreminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: AppState())
        }
    }
}
