//
//  CounterView.swift
//  StateManagementRepeat
//
//  Created by Wouter on 29/04/2022.
//

import SwiftUI

struct CounterView: View {
    @StateObject var state: AppState
    
    var body: some View {
        VStack{
            HStack{
                Button("Increment", action: {self.state.count += 1})
                .padding()
            Button("Decrement", action: {self.state.count -= 1})
                .padding()
            }
            Text("\(self.state.count)")
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
