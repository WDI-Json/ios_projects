//
//  ClassicNavView.swift
//  StatemanagementTabbar
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

struct ClassicNavView: View {
    @StateObject var state: AppState
    var body: some View {
        NavigationView{
            List {
                Text("Item 1")
                Text("Item 2")
                Text("Item 3")
                NavigationLink("HelloWorldView", destination: HelloWorldView())
                NavigationLink("Counter", destination: CounterView(state: self.state))
                Text("Item 5")
            }
            .navigationTitle("Classic View")
        }
    }
}

struct ClassicNavView_Previews: PreviewProvider {
    static var previews: some View {
        ClassicNavView(state: AppState())
    }
}
