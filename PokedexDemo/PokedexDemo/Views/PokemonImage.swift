//
//  PokemonImage.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import SwiftUI

struct PokemonImage: View {
    var spriteURL = ""
    
    var body: some View {
        AsyncImage(url: URL(string: spriteURL))
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.6))
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
