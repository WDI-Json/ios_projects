//
//  ContentView.swift
//  TabbarviewKata
//
//  Created by Wouter on 02/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab = 0
    
    var body: some View {
        NavigationView{
            TabView(selection: self.$currentTab) {
                BananaView.tag(0)
                AppleView.tag(1)
                PeachView.tag(2)
            }
            .foregroundColor(Color.white)
            .background(Color.white)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
        //.navigationBarTitleDisplayMode(.inline)
    }
}

struct bananaContent: View {
    var body: some View{
        Text("banana")
    }
}
var BananaView: some View {
    Color.yellow
        .edgesIgnoringSafeArea(.all)
        .border(Color.blue, width: 1)
}

var AppleView: some View {
    Color.green
        .edgesIgnoringSafeArea(.all)
        .border(Color.blue, width: 1)
}

var PeachView: some View {
    Color.orange
        .edgesIgnoringSafeArea(.all)
        .border(Color.white, width: 1)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
