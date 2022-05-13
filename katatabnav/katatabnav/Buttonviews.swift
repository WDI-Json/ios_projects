//
//  Buttonviews.swift
//  katatabnav
//
//  Created by Wouter on 13/05/2022.
//

import SwiftUI

struct RedPillButton: View {
    var body: some View {
        Button(action: {}) {
            HStack{
                Image(systemName: "phone.fill")
                Text("Bel 112")
                    .bold()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(.white)
        .background(.red)
        .clipShape(Capsule())
        .shadow(radius: 5)
        .padding()
    }
}

struct RedCircleButton: View {
    var body: some View {
        Button(action: {}) {
                Image(systemName: "phone.fill")
        }
        .padding()
        .foregroundColor(.white)
        .background(.red)
        .clipShape(Circle())
        .shadow(radius: 5)
    }
}
        
struct UnderlinedTextCall: View {
    var body: some View {
        Group {
            Text("BEL 112")
                .font(Font.system(size: 13, design: .default))
                .bold()
                .foregroundColor(.blue)
                .font(.body)
                .padding([.top, .bottom], 6)
                .overlay(Rectangle()
                    .frame(height: 3)
                    .foregroundColor(.blue),
                         alignment: .bottom)
        }
    }
}
                
struct Buttonviews_Previews: PreviewProvider {
    static var previews: some View {
        RedPillButton()
                   .frame(width: 350, height: 50)
                   .previewLayout(.sizeThatFits)
                   .padding()
               
               RedCircleButton()
                   .frame(width: 50, height: 50)
                   .previewLayout(.sizeThatFits)
                   .padding()
               
               UnderlinedTextCall()
                   .frame(width: 50, height: 50)
                   .previewLayout(.sizeThatFits)
                   .padding()
    }
}
