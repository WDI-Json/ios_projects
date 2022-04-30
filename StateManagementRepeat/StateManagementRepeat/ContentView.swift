//
//  ContentView.swift
//  StateManagementRepeat
//
//  Created by Wouter on 29/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state: AppState
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: CounterView(state: self.state)){
                    Text("CounterView")
                }

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
