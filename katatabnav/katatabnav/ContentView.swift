//
//  ContentView.swift
//  katatabnav
//
//  Created by Wouter on 13/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        NavigationView {
            TabView(selection: self.$currentTab){
                viewUNO()
                    .tag(0)
                viewDOS()
                    .tag(1)
                viewTRES()
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action:{
                        withAnimation {
                            self.currentTab = 0
                        }
                        print("hij doet iets")
                    }) {
                        Text("BEL 112")
                            .bold()
                            .font(Font.system(size:13, design: .monospaced))
                            .underline()
                    }
                    Button(action: {
                        withAnimation {
                            self.currentTab = 1
                    }
                        print("refreshemente")
                    }) {
                        Text("refresh")
                            .bold()
                            .font(Font.system(size:13, design: .monospaced))
                            .underline()
                    }
                        
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("button action")
                    }) {
                        Label("buttonlabel", systemImage: "info.circle.fill")
                    }
                    Button(action:{
                        print("this button also works")
                    }) {
                        Label("otherbutton", systemImage: "gearshape.fill")
                    }
                }
            }
        }
    }
}

struct viewUNO: View {
    var body: some View{
            List {
                Text("hello wurld")
                Text("hello wurld")
                Text("hello wurld")
                Text("hello wurld")
                Text("hello wurld")
        }
    }
}


struct viewDOS: View {
    var body: some View{
        Text("asdasdasdsadas")
    }
}


struct viewTRES: View {
    var body: some View{
        Text("vieweiemente")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
