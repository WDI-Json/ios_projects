//
//  ContentView.swift
//  ProjectButtonViewKata
//
//  Created by Wouter on 27/04/2022.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        Button("Press me!") {
            print("Et was passiert heute!")
        }
        .padding()
    }
}

struct HelloWorldView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
            .navigationTitle("Hello, User!")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: ButtonView()){
                 Text("Checkout the ButtonView")
                }
                Text("Something Noteworthy")
                NavigationLink(
                    destination: HelloWorldView()){
                 Text("Hello, who?")
                }
            }
            .navigationTitle("Pick your path!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
