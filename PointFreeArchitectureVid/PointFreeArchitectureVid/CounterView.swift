//
//  CounterView.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}

struct CounterView: View {
    @StateObject var state : AppState
    @State var isPrimeModalShown: Bool = false
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.state.count -= 1
                })
                {Text("-")}
                Text("\(self.state.count)")
                Button(action: {
                    self.state.count += 1})
                {Text("+")}
            }
            
            Button(action: {self.isPrimeModalShown = true}){
                Text("Is this prime?")
            }
            Button(action: {}) {
                Text("What's the \(ordinal(self.state.count)) prime?")
            }
        }
        .font(.title)
        .navigationTitle("CounterDemo")
        .sheet(isPresented: self.$isPrimeModalShown) {
            IsPrimeModalView(state: self.state)
        }
        .alert(item: self.$alertNthPrime) { alert in
          Alert(
            title: Text("The \(ordinal(self.state.count)) prime is \(alert.prime)"),
            dismissButton: .default(Text("Ok"))
          )
    }
}

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
                Button(action: {self.state.favoritePrimes.removeAll(where: {$0 == self.state.count}) }) {
                    Text("Remove from favorite primes")
                }
            } else {
                Button(action: {self.state.favoritePrimes.append(self.state.count)}) {
                    Text("Save to favorite primes")
                }
            }
        }
        else {
            Text("\(self.state.count) is not prime :(")
        }
    }
}

struct WolframAlphaResult: Decodable {
    let queryresult: QueryResult
    
    struct QueryResult: Decodable {
        let pods: [Pod]
        
        struct Pod: Decodable {
            let primary: Bool?
            let subpods: [SubPod]
            
            struct SubPod: Decodable {
                let plaintext: String
            }
        }
    }
}

func wolframAlpha(query: String, callback: @escaping (WolframAlphaResult?) -> Void) -> Void {
    var components = URLComponents(string: "https://api.wolframalpha.com/v2/query")!
    components.queryItems = [
        URLQueryItem(name: "input", value: query),
        URLQueryItem(name: "format", value: "plaintext"),
        URLQueryItem(name: "output", value: "JSON"),
        URLQueryItem(name: "appid", value: wolframAlphaApiKey),
    ]
    
    URLSession.shared.dataTask(with: components.url(relativeTo: nil)!) { data, response, error in
        callback(
            data
                .flatMap { try? JSONDecoder().decode(WolframAlphaResult.self, from: $0) }
        )
    }
    .resume()
}


func nthPrime(_ n: Int, callback: @escaping (Int?) -> Void) -> Void {
    wolframAlpha(query: "prime \(n)") { result in
        callback(
            result
                .flatMap {
                    $0.queryresult
                        .pods
                        .first(where: { $0.primary == .some(true) })?
                        .subpods
                        .first?
                        .plaintext
                }
                .flatMap(Int.init)
        )
    }
}


struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
