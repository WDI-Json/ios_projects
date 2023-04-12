//
//  CounterView.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import SwiftUI
import ComposableArchitecture
import FavoritePrimes
import PrimeModal

typealias CounterViewState = (count: Int, favoritePrimes: [Int])

struct CounterView: View {
    @ObservedObject var store: Store<CounterViewState, AppAction>
    @State var isPrimeModalShown: Bool = false
    @State var alertNthPrime: PrimeAlert?
    @State var isNthPrimeButtonDisabled = false

    var body: some View {
        VStack {
            HStack {
                Button("-") { self.store.send(.counter(.decrTapped)) }
                Text("\(self.store.value.count)")
                Button("+") { self.store.send(.counter(.incrTapped)) }
            }
            Button("Is this prime?") { self.isPrimeModalShown = true }
            Button(action: self.nthPrimeButtonAction) {
                Text("What is the \(ordinal(self.store.value.count)) prime?")
            }
            .disabled(self.isNthPrimeButtonDisabled)
        }
        .font(.title)
        .navigationBarTitle("Counter demo")
        .sheet(isPresented: self.$isPrimeModalShown) {
            IsPrimeModalView(
                // if you have issues change back to typealias
                store: self.store
                    .view(
                        value: { PrimeModalState(count: $0.count, favoritePrimes: $0.favoritePrimes) },
                        action: {.primeModal($0)}
                        )
            )
        }
        .alert(item: self.$alertNthPrime) { alert in
            Alert(
                title: Text("The \(ordinal(self.store.value.count)) prime is \(alert.prime)"),
                dismissButton: .default(Text("Ok"))
            )
        }
    }

    func nthPrimeButtonAction() {
        isNthPrimeButtonDisabled = true
        WolframProvider().nthPrime(store.value.count) { prime in
            self.alertNthPrime = prime.map(PrimeAlert.init(prime:))
            self.isNthPrimeButtonDisabled = false
        }
    }
}

private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}

//struct CounterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CounterView(store: Store(initialValue: AppState(), reducer: appReducer))
//    }
//}
