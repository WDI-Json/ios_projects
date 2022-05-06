//
//  CounterView.swift
//  CodeKataStatemanagementreminder
//
//  Created by Wouter on 04/05/2022.
//

import SwiftUI

struct CounterView: View {
    @StateObject var state: AppState
    var body: some View {
        VStack{
            HStack{
                Button("Increment", action: {self.state.count += 1})
                    .padding()
                    .buttonStyle(GrowingButton())
                Button("Decrement", action: {self.state.count -= 1})
                    .padding()
                    .buttonStyle(ShrinkingButton())
            }
            Text("\(self.state.count)")
                .padding()
                .border(.orange, width: 3)
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct ShrinkingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeIn(duration: 0.2), value: configuration.isPressed)
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(state: AppState())
    }
}
