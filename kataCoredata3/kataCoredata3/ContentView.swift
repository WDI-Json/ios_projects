//
//  ContentView.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    @State private var name: String = "Smoothiename"
    
    var body: some View {
        NavigationView() {
            List {
                NavigationLink("Smoothie recipes", destination: SmoothieRecipesView())
                NavigationLink("Generate Smoothie!", destination: AddSmoothieView())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
