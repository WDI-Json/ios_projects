//
//  viewsWithStateApp.swift
//  viewsWithState
//
//  Created by Wouter on 28/04/2022.
//

import SwiftUI

@main
struct viewsWithStateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: AppState())
        }
    }
}
