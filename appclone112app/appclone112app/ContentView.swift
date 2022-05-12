//
//  ContentView.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Int = 0
    
    
    var body: some View {
        NavigationView {
            TabView(selection: self.$currentTab) {
                view1().tag(0)
                view2().tag(1)
                view3().tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            self.currentTab = 0
                        }
                        print("deze tabknopt doet iets")
                    }) {
                        Text("BELLEN")
                            .bold()
                            .font(Font.system(size: 13, design: .monospaced))
                            .underline()
                    }
                    Button(action: {
                        withAnimation {
                            self.currentTab = 1
                        }
                        print("refresh werkt ook")
                    }) {
                        Text("CHAT")
                            .bold()
                            .font(Font.system(size:13, design: .monospaced))
                            .underline()
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Refresh?")
                    }) {
                        Label("Refresh", systemImage: "info.circle.fill")
                    }
                    Button(action: {
                        print("edit")
                    }) {
                        Label("Edit", systemImage: "gearshape.fill")
                    }
                }
                
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
