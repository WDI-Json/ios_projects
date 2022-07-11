//
//  MyPokedexView.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import SwiftUI

struct MyPokedexView: View {
    @StateObject var state: AppState
    @State var pokemon = [PokemonEntry]()
    @State var pokemonCaught = [PokedexEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(caughtPokemon()) { entry in
                    HStack {
                        PokemonImage(spriteURL: "\(entry.sprites.front_default ?? "")")
                            .padding(.trailing, 20)
                        NavigationLink("\(entry.name)".capitalized, destination: PokemonDetailsView(pokemon: entry))
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Caught Pokémon")
            .onAppear {
                PokemonExternalProxyAPI().getAll() { pokemon in
                    self.pokemon = pokemon
                    
                    PokemonExternalProxyAPI().getPokedex() { pokedexEntries in
                        self.pokemonCaught = pokedexEntries
                    }
                }
            }
        }
    }
    func caughtPokemon() -> [PokemonEntry] {
        let caughtPokemonIds = pokemonCaught.map { pokemonEntry in pokemonEntry.id }
        let myCaughtPokemon = pokemon.filter( { caughtPokemonIds.contains($0.id) })
        
        if searchText == "" {
            return myCaughtPokemon
        } else {
            return myCaughtPokemon.filter({ $0.name.contains(searchText.lowercased()) })
        }
    }
}
struct myPokedexView_Previews: PreviewProvider {
    static var previews: some View {
        MyPokedexView(state: AppState())
    }
}

