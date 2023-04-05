//
//  FavoritePrimesView.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import SwiftUI
import ComposableArchitecture

struct FavoritePrimesView: View {
    @ObservedObject var store: Store<[Int], AppAction>

    var body: some View {
        List {
            ForEach(self.store.value, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                self.store.send(.favoritePrimes(.deleteFavoritePrimes(indexSet)))
            }
        }
        .navigationBarTitle(Text("Favorite Primes"))
    }
}
