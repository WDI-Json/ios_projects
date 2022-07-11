//
//  Pokemon.swift
//  kataCRUD_pokemon
//
//  Created by Wouter on 24/06/2022.
//

import Foundation

struct PokemonEntry: Codable, Identifiable {
    var id: Int
    var name: String
    var sprites: Sprites
    var catched: Bool?
    var weight: Int?
}

struct Sprites: Codable {
    var front_default: String?
    var front_shiny: String?
}

struct PokedexEntry: Codable, Identifiable {
    var id: Int
    var name: String
}
