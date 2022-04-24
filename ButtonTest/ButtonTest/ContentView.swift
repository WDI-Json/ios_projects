//
//  ContentView.swift
//  ButtonTest
//
//  Created by Wouter on 24/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showInformation = false
    
    var body: some View {
        Button("What is coding?")
            {
                showInformation.toggle()
            }

        
    if showInformation {
        Text("The process of transforming the design of a system into a computer language format.")
            .foregroundColor(.black)
            .font(.title)
            .padding()
            .border(Color.gray, width: 5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
