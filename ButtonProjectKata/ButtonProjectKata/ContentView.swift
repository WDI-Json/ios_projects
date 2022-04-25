//
//  ContentView.swift
//  ButtonProjectKata
//
//  Created by Wouter on 24/04/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var infoShow = false
    
    var body: some View {
        
        if infoShow {
            Text("Hiya Pap!")
                .fontWeight(.bold)
                .font(.title)
                .padding()
                .background(Color.white)
                .foregroundColor(Color.gray)
                .padding(10)
                .border(Color.red, width: 5)
        }
        
        Button("Press me!") {
            infoShow.toggle()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
