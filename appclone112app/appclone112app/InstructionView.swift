//
//  view2.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("image")
                .resizable()
                    .frame(height: 200)
            Text("Communiceer via de chat")
                .bold()
                .padding(30)
                .font(Font.system(size: 20, design: .default))
            HStack{
                numberView(1)
                    .padding(.horizontal)
                Text("Bel eerst 112 via een rode belknop in het 'Bellen' scherm.")
                    .padding()
            }
            HStack {
                numberView(2)
                    .padding(.horizontal)
                Text("Kom tijdens het bellen terug naar de 112NL app.")
                    .padding()
            }
            HStack{
                numberView(3)
                    .padding(.horizontal)
                Text("Wacht tot de chat gestart wordt. Let op: Dit kan even duren.")
                    .padding()
            }
        }
    }
}

@ViewBuilder
func numberView(_ number: Int) -> some View {
    let number: String = String(number)
    ZStack{
    Text(number)
        .font(Font.system(size: 20, design: .default))
        .bold()
        .padding()
        .foregroundColor(.white)
        .background(.blue)
        .clipShape(Circle())
    }
        
}


struct view2_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
