//
//  ContentView.swift
//  ButtonKata
//
//  Created by Wouter on 27/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var information = false
    
    var body: some View {
        Button("Press me!") {
            information.toggle()
        }
        
        if information {
            
            NavigationView {
                List {
                    Text("Textblock1")
                    Text("Textblock2")
                    Text("Textblock3")
                }
                .navigationTitle("Textblocksview")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
