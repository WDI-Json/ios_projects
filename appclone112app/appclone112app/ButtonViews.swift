//
//  ButtonViews.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct RedPillButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "phone.fill")
                Text("BEL 112")
                    .bold()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .foregroundColor(Color.white)
        .background(Color(red: 0.9, green: 0, blue: 0.12))
        .clipShape(Capsule())
        .shadow(radius: 5)
        .padding()
    }
}

@ViewBuilder
func RedCircleButton(_ imagename: String ) -> some View {
    Button(action:{}){
        Image(imagename)
            .resizable()
            .frame(width: 40.0, height: 40.0)
    }
    .padding()
    .foregroundColor(Color.white)
    //228,28,12
    .background(Color(red: 0.9, green: 0, blue: 0.12))
    .clipShape(Circle())
    .shadow(radius: 5)
}

@ViewBuilder
func  UnderlinedTextCall(_ text: String) -> some View {
    Group {
        Text(text)
            .font(Font.system(size: 13, design: .default))
            .bold()
            .foregroundColor(.blue)
            .padding([.top, .bottom], 3)
            .overlay(Rectangle()
                .frame(height: 3)
                .foregroundColor(.blue),
                     alignment: .bottom
            )
    }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
        RedPillButton()
            .frame(width: 350, height: 50)
            .previewLayout(.sizeThatFits)
            .padding()
        
        RedCircleButton("brandweer")
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
            .padding()
        
        RedCircleButton("politie")
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
            .padding()
        
        RedCircleButton("ambulance")
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
            .padding()
        
        UnderlinedTextCall("BELLEN!")
            .frame(width: 50, height: 50)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
