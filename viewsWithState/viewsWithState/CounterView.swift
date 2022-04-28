//
//  CounterView.swift
//  viewsWithState
//
//  Created by Wouter on 28/04/2022.
//

import SwiftUI

struct CounterView: View {
    @StateObject var state: AppState
    var body: some View {
        HStack{
            Button("Add" , action: {self.state.currentNumber += 1})
                .padding()
                .border(.blue, width: 3)
            Text("\(self.state.currentNumber)")
                .padding()
            Button("Subtract" , action: {self.state.currentNumber -= 1})
                .padding()
                .border(.blue, width: 3)
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
