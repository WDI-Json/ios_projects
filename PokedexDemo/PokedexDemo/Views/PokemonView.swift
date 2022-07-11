//
//  PokemonView.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import SwiftUI

struct PokemonView: View {
    @StateObject var state: AppState
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredPokemon()) { entry in
                    HStack {
                        PokemonImage(spriteURL: "\(entry.sprites.front_default ?? entry.sprites.front_shiny ?? "")")
                            .padding(.trailing, 20)
                        NavigationLink("#\(entry.id) \(entry.name)".capitalized, destination: PokemonDetailsView(pokemon: entry))
                    }
                }
            }
            .navigationTitle("Pokédex")
            .searchable(text: $searchText)
            .onAppear {
                PokemonExternalProxyAPI().getAll() { pokemon in
                    self.pokemon = pokemon
                }
            }
        }
    }
    private func filteredPokemon() -> [PokemonEntry] {
        if searchText == "" {
            return pokemon
        } else {
            return pokemon.filter({ $0.name.contains(searchText.lowercased()) })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(state: AppState())
    }
}
