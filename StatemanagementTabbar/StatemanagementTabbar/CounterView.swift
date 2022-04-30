//
//  CounterView.swift
//  StatemanagementTabbar
//
//  Created by Wouter on 30/04/2022.
//

import SwiftUI

struct CounterView: View {
    @StateObject var state: AppState
    var body: some View {
        VStack{
            
            Text("\(self.state.count)")
                .padding()
                .border(.black, width: 3)
            
            HStack{
                Button("Increment", action: {self.state.count+=1})
                    .padding()
                    .border(.green, width: 3)
                Button("Decrement", action: {self.state.count-=1})
                    .padding()
                    .border(.red, width: 3)
            }
        }
    }
}


struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
