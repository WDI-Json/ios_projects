//
//  view2.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct view2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("image")
                .resizable()
                    .frame(height: 200)
            Text("Communiceer via de chat")
                .bold()
                .padding(40)
                .font(Font.system(size: 30, design: .default))
            HStack{
                numberView(1)
                    .padding(.horizontal)
                Text("Bel eerst 112 via een rode belknop in het 'Bellen' scherm.")
            }
            HStack {
                numberView(2)
                    .padding(.horizontal)
                Text("Kom tijdens het bellen terug naar de 112NL app.")
            }
            HStack{
                numberView(3)
                    .padding(.horizontal)
                Text("Wacht tot de chat gestart wordt. Let op: Dit kan even duren.")
            }
        }
    }
}

@ViewBuilder
func numberView(_ number: Int) -> some View {
    let number: String = String(number)
    Text(number)
        .padding()
        .foregroundColor(.white)
        .background(.blue)
        .clipShape(Circle())
}


struct view2_Previews: PreviewProvider {
    static var previews: some View {
        view2()
    }
}
