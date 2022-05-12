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
        .background(Color(red: 1.0, green: 0, blue: 0))
        .clipShape(Capsule())
        .shadow(radius: 5)
        .padding()
    }
}

struct RedCircleButton: View {
    var body: some View {
        Button(action:{}){
            Image(systemName: "phone.fill")
        }
        .padding()
        .foregroundColor(Color.white)
        .background(Color(red: 1.0, green: 0, blue: 0))
        .clipShape(Circle())
        .shadow(radius: 5)
    }
}

struct UnderlinedTextCall: View {
    var body: some View {
        Group {
            Text("BELLEN")
                .font(Font.system(size: 13, design: .default))
                .bold()
                .foregroundColor(.blue)
                .font(.body)
                .padding([.top, .bottom], 6)
                .overlay(Rectangle()
                    .frame(height: 3)
                    .foregroundColor(.blue),
                         alignment: .bottom
                )
        }
    }
}

struct ButtonViews_Previews: PreviewProvider {
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
