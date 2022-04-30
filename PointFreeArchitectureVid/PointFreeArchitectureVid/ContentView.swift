//
//  ContentView.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state : AppState
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: CounterView(state: self.state)) {
                    Text("CounterView")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favorite Prime")
                }
            }
            .navigationTitle("StateManagement")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
