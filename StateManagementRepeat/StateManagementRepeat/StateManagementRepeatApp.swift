//
//  StateManagementRepeatApp.swift
//  StateManagementRepeat
//
//  Created by Wouter on 29/04/2022.
//

import SwiftUI

@main
struct StateManagementRepeatApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: AppState())
        }
    }
}
