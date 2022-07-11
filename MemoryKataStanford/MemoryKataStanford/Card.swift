//
//  Card.swift
//  MemoryKataStanford
//
//  Created by Wouter on 20/06/2022.
//

import SwiftUI

struct Card: View {
    //pointer to memory
    @State var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text("🎉").font(.largeTitle)
            } else {
                shape.fill()
            }
                
        }.onTapGesture{
            isFaceUp.toggle()
        }
        .foregroundColor(.red)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}
