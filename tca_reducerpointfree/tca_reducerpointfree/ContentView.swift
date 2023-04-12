//
//  ContentView.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//
import Foundation
import SwiftUI
import ComposableArchitecture
import FavoritePrimes

struct ContentView: View {
    @ObservedObject var store: Store<AppState, AppAction>
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination:
                                CounterView(
                                    store: self.store
                                        .view(
                                            value: { ($0.count, $0.favoritePrimes) },
                                            action: { $0 }
                                        )
                                )
                ) {
                    Text("Counter demo")
                }
                NavigationLink(destination: FavoritePrimesView(
                    store: self.store
                        .view(
                            value: { $0.favoritePrimes },
                            action: { .favoritePrimes($0) }
                        ))
                ) {
                    Text("Favorite primes")
                }
            }
            .navigationBarTitle("State management")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialValue: AppState(),
                reducer: logging(activityFeed(appReducer))
            )
        )
    }
}
