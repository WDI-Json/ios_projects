//
//  ContentView.swift
//  CodeKataStatemanagementreminder
//
//  Created by Wouter on 04/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state: AppState
    
    var body: some View {
        NavigationView{
            List {
                NavigationLink(destination: CounterView(state: self.state)){
                    Text("CounterView")
                }
                Text("Item2")
                Text("Item3")
                Text("Item4")
            }
            .navigationTitle("Menu")
        }
            
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
