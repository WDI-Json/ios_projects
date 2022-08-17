//
//  ContentView.swift
//  LocalizableStringsDEMO
//
//  Created by Wouter on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                Text("Some text")
                    .padding()
                Text("A story")
                    .padding()
                Text("Demo using localizable strings!")
                    .padding()
            }
            .navigationTitle("Localizable strings")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
