//
//  PokedexDemoApp.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//


import SwiftUI

@main
struct ArcadyAssessmentApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView(state: AppState())
        }
    }
}
