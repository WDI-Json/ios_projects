//
//  ContentView.swift
//  ButtonViewKata
//
//  Created by Wouter on 27/04/2022.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button("Press me!") { print("something happens") }
            .padding()
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ButtonView()) {
                    Text("ButtonView")
                }
                Text("Textblock2")
                Text("Textblock3")
            }
            .navigationTitle("Textblocksview")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
