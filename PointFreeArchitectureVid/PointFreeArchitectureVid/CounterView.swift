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
            Button(action: {}){
                Text("Is this prime?")
                    .font(.title)
            }
            Button(action: {}) {
                Text("What's the \(ordinal(self.state.count)) prime?")
                    .font(.title)
            }
        }
    }
}


struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
