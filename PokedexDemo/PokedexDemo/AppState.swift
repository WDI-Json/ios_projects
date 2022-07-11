//
//  AppState.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import Foundation

import Combine

class AppState: ObservableObject {
    @Published var selectedTab = TabItems.pokemon
}

enum TabItems: Hashable {
    case pokemon, myPokedexEntries
}
