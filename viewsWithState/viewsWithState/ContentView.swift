//
//  ContentView.swift
//  viewsWithState
//
//  Created by Wouter on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var state: AppState
    var body: some View {
        NavigationView {
            List{
                NavigationLink(destination: HelloWorldView()) {
                    Text("BasicView")
                }
                NavigationLink(destination: CounterView(state: self.state)){
                    Text("CounterView")
                }
                NavigationLink(destination: StatusCounterView(state: self.state)){
                    Text("StatusCounterView")
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
