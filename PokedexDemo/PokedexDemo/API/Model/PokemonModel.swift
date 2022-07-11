//
//  PokemonModel.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import Foundation

//All possible entries
struct PokemonEntry: Codable, Identifiable {
    var id: Int
    var name: String
    var sprites: Sprites
    var catched: Bool?
    var weight: Int?
}
//image urls
struct Sprites: Codable {
    var front_default: String?
    var front_shiny: String?
}
//All entries that are caught
struct PokedexEntry: Codable, Identifiable {
    var id: Int
    var name: String
}
