//
//  StatemanagementTabbarApp.swift
//  StatemanagementTabbar
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

@main
struct StatemanagementTabbarApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(state: AppState())
        }
    }
}
