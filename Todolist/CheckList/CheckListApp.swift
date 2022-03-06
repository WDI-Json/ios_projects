//
//  TodolistApp.swift
//  Todolist
//
//  Created by Wouter on 27/02/2022.
//

import SwiftUI
/*
 MVVM architectuur
 
 Model - data point (database objects)
 View - UI
 ViewModel - class that manages the model for the view.
 
 */
@main
struct CheckListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            
        }
    }
}
