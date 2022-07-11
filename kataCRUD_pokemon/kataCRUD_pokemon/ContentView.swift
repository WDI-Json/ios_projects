//
//  ContentView.swift
//  kataCRUD_pokemon
//
//  Created by Wouter on 24/06/2022.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    
    var body: some View {
        NavigationView{
            List {
                ForEach(pokemon) { entry in
                    HStack {
                        Image(systemName: "person.circle")
                            .padding(.trailing, 20)
                        NavigationLink("#\(entry.id) \(entry.name)".capitalized, destination: EmptyView())
                    }
                }
            }
            .navigationTitle("Pokédex")
            .onAppear {
                PokemonAPI().getAll() { pokemon in
                    self.pokemon = pokemon
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
