//
//  ContentView.swift
//  appCloneKata
//
//  Created by Wouter on 10/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        NavigationView{
            TabView(selection: self.$currentTab){
                HelloWorldView1().tag(0)
                HelloWorldView2().tag(1)
                HelloWorldView3().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode:.never))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            self.currentTab = 0
                        }
                        print("Hij werkt")
                    })
                    {
                        Text("doe iets")
                            .bold()
                            .font(Font.system(size: 13, design: .monospaced))
                            .underline()
                    }
                    Button(action: {
                        withAnimation {
                            self.currentTab = 1
                        }
                        print("refresh")
                    }) {
                        Text("Refresh iets")
                            .bold()
                            .font(Font.system(size: 13, design: .monospaced))
                            .underline()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("refresh")
                    }) {
                        Label("refreshlabel", systemImage: "info.circle.fill")
                    }
                    Button(action:{
                        print("Edit werkt ook")
                    }) {
                        Label("Editlabel", systemImage: "gearshape.fill")
                    }
                }
            }
            
        }
    }
}

struct toolbarConcent: ToolbarContent{
    @State var currentTab: Int = 0
    var body: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarLeading) {
            Button(action: {
                withAnimation {
                    self.currentTab = 0
                }
                print("Hij werkt")
            })
            {
                Text("doe iets")
                    .bold()
                    .font(Font.system(size: 13, design: .monospaced))
                    .underline()
            }
        }
    }
}
struct HelloWorldView1: View{
    var body: some View{
        Text("Hello, Sir!")
            .padding()
    }
}

struct HelloWorldView2: View{
    var body: some View{
        Text("Hello, Madam!")
            .padding()
    }
}
struct HelloWorldView3: View{
    var body: some View{
        Text("Hello, Friend!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
