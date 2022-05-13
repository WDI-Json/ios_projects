//
//  view1.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct view1: View {
    var body: some View {
        VStack{
            Text("Uw locatie")
                .padding(150)
            RedPillButton()
            LabelledDivider(label: "of")
            VStack{
                HStack{
                    
                    RedCircleButton()
                        .padding()
                    RedCircleButton()
                        .padding()
                    RedCircleButton()
                        .padding()
                }
                HStack{Text("Politie")
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                    Text("Brandweer")
                        .padding(.horizontal)
                    Text("Ambulance")
                }
            }
        }
        
    }
    
}


struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}
