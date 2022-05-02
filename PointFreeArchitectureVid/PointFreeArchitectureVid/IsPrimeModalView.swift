//
//  IsPrimeModalView.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 01/05/2022.
//

import SwiftUI

private func isPrime (_ p: Int) -> Bool {
    if p <= 1 { return false }
    if p <= 3 { return true }
    for i in 2...Int(sqrtf(Float(p))) {
        if p % i == 0 { return false }
    }
    return true
}
    
struct IsPrimeModalView: View {
    @StateObject var state: AppState
    
    var body: some View {
        if isPrime(self.state.count) {
            Text("\(self.state.count) is prime 🎉")
            if self.state.favoritePrimes.contains(self.state.count) {
                Button(action: {
                    self.state.favoritePrimes.removeAll(where: { $0 == self.state.count})
                    self.state.activityFeed.append(.init(timestamp: Date(), type:
                            .removedFavoritePrime(self.state.count)))
                }) {
                    Text("Remove from favorite primes")
                }
            } else {
                Button(action: {
                    self.state.favoritePrimes.append(self.state.count)
                    self.state.activityFeed.append(.init(timestamp: Date(),
                                                         type: .addedFavoritePrime(self.state.count)))
                }) {
                    Text("Save to favorite primes")
                }
            }
        }
        else {
            Text("\(self.state.count) is not prime :(")
        }
    }
}

struct FavoritePrimesView: View {
    @StateObject var state: AppState
    
    var body: some View {
        List {
            ForEach(self.state.favoritePrimes, id: \.self) { prime in
                Text("\(prime)")
            }
            .onDelete { indexSet in
                for index in indexSet {
                    let prime = self.state.favoritePrimes[index]
                    self.state.favoritePrimes.remove(at: index)
                    self.state.activityFeed.append(
                        .init(timestamp: Date(),
                              type: .removedFavoritePrime(prime)
                             )
                    )
                }
            }
        }
        .navigationBarTitle(Text("Favorite Primes"))
    }
}

extension AppState {
    func addFavoritePrime() {
        self.favoritePrimes.append(self.count)
        self.activityFeed.append(
            Activity(timestamp: Date(),
                     type: .addedFavoritePrime(self.count)))
    }
    
    func removeFavoritePrime(_ prime: Int) {
        self.favoritePrimes.removeAll(where: {$0 == prime})
        self.activityFeed.append(Activity(timestamp: Date(), type: .removedFavoritePrime(self.count)))
    }
    
    func removeFavoritePrime() {
        self.removeFavoritePrime(self.count)
    }
    
    func removeFavoritePrimes(at indexSet: IndexSet) {
        for index in indexSet {
            self.removeFavoritePrime(self.favoritePrimes[index])
        }
    }
}


struct IsPrimeModalView_Previews: PreviewProvider {
    static var previews: some View {
        IsPrimeModalView(state: AppState())
    }
}
