//
//  ContentView.swift
//  PointFreeArchitectureVid
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI
import Combine

class AppState: ObservableObject{
    @Published var count: Int = 0
}

private func ordinal(_ n: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(for: n) ?? ""
}

struct ContentView: View {
    @StateObject var state : AppState
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: CounterView(state: self.state)) {
                    Text("CounterView")
                }
                NavigationLink(destination: EmptyView()) {
                    Text("Favorite Prime")
                }
            }
            .navigationTitle("StateManagement")
        }
    }
}
struct CounterView: View {
    @StateObject var state : AppState
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.state.count -= 1
                }
                )
                {Text("-")}
                Text("\(self.state.count)")
                Button(action: {
                    self.state.count += 1}
                )
                {Text("+")}
            }
        }
        Button(action: {}){
            Text("Is this prime?")
        }
        Button(action: {}) {
            Text("What's the \(ordinal(self.state.count)) prime?")
        }.font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
