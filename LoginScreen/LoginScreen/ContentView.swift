//
//  ContentView.swift
//  LoginScreen
//
//  Created by Wouter on 02/08/2022.
//

import SwiftUI

struct ContentView: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @State var username: String = ""
    
    var body: some View {
        VStack {
            WelcomeText()
            UserImage()
        }
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welkom bij Deskie!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
            TextField(title: , text: $username)
    }
}

struct UserImage: View {
    var body: some View {
        Image("foto")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
