//
//  ContentView.swift
//  KataStructsNViews
//
//  Created by Wouter on 27/04/2022.
//

import SwiftUI

struct HelloWorldView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .navigationTitle("Hello, User!")
    }
}

struct SomeExtraContent: View {
    var body: some View {
        Image("Image")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("Graph")
            .navigationTitle("Meer of minder?")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: HelloWorldView())
                    {Text("Hello, who?")}
                NavigationLink(destination: SomeExtraContent()) {
                    Text("TompouceTime?")}
                Text("Some other static item")
                Text("Some other static item")
                Text("Some other static item")
                Text("Some other static item")
            }
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
