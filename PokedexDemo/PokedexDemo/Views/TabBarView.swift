//
//  TabBarView.swift
//  PokedexDemo
//
//  Created by Wouter on 11/07/2022.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var state: AppState
    
    var body: some View {
        TabView(selection: $state.selectedTab) {
            PokemonView(state: self.state)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Pokédex")
                }.tag(TabItems.pokemon)
            MyPokedexView(state: self.state)
                .tabItem {
                    Label("My Collection", systemImage: "square.and.pencil")
                }.tag(TabItems.myPokedexEntries)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(state: AppState())
    }
}
