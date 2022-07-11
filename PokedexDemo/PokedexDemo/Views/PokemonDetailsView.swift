//
//  PokemonDetailsView.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import SwiftUI

struct PokemonDetailsView: View {
    @State var pokemon: PokemonEntry
    
    var body: some View {
        VStack(spacing: 10) {
            showPokemonBio(Pokemon: pokemon)
            Button(action: { addPokemon(id: pokemon.id) }) {
                Image("Pokeball")
                    .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
            }
            Text("Catch this Pokémon!")
            Button(action: { removePokemon(id: pokemon.id) }) {
                Text("Remove from pokedex")
            }
            .buttonStyle(removeButton())
        }
        .navigationTitle("\(pokemon.name)".capitalized)
    }
    
    private func showPokemonBio(Pokemon: PokemonEntry) -> AnyView {
        return AnyView (
            VStack {
                HStack {
                    PokemonImage(spriteURL: "\(pokemon.sprites.front_default ?? "")")
                        .padding(.trailing, 20)
                    PokemonImage(spriteURL: "\(pokemon.sprites.front_shiny ?? "")")
                        .padding(.trailing, 20)
                }
                Text("Number #\(pokemon.id) of the 151 Pokémon! Has been spotted in this shiny form as well:")
                    .padding(.horizontal)
            }
        )}
    
    private func addPokemon(id: Int) {
        PokemonExternalProxyAPI().savePokemonInPokedex(withID: id) { result in
            print("ADD isSucces = \(result)")
        }
    }
    private func removePokemon(id: Int) {
        PokemonExternalProxyAPI().removePokemonFromPokedex(withID: id) { result in
            print("DELETE isSucces = \(result)")
        }
    }
}

struct removeButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(.red)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(pokemon: PokemonEntry(id: 12, name: "butterfree", sprites: Sprites()))
    }
}
