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

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .gray) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}
