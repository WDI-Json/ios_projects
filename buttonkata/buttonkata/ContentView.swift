//
//  ContentView.swift
//  buttonkata
//
//  Created by Wouter on 25/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var information = false
    
    var body: some View {
        Button("Press me!"){
            information.toggle()
        }
        if information {
            Text("The button is working!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
