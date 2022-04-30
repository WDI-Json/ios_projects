//
//  ContentView.swift
//  StatemanagementTabbar
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state: AppState
    var body: some View {
        TabView {
            HelloWorldView()
                .tabItem {
                    Label("HelloWorld", systemImage: "person.3")
                }
            CounterView(state: self.state)
                .tabItem {
                    Label("Counter", systemImage: "checkmark.circle")
                }
            ClassicNavView(state: self.state)
                .tabItem {
                    Label("Uncontacted", systemImage: "questionmark.diamond")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
