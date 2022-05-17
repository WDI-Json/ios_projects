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
                MainView().tag(0)
                InstructionView().tag(1)
                informationGuideView().tag(2)
                SettingsView().tag(3)
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
                        if self.currentTab == 0 {
                            UnderlinedTextCall("BELLEN")
                        } else
                        {      Text("BELLEN")
                                .bold()
                                .font(Font.system(size: 13, design: .monospaced))
                                .foregroundColor(.gray)
                        }
                    }
                    Button(action: {
                        withAnimation {
                            self.currentTab = 1
                        }
                        print("refresh werkt ook")
                    }) {
                        if self.currentTab == 1 {
                            UnderlinedTextCall("CHATTEN")
                        } else
                        {      Text("CHATTEN")
                                .bold()
                                .font(Font.system(size: 13, design: .monospaced))
                                .foregroundColor(.gray)
                        }
                    }
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation{
                            self.currentTab = 2
                        }
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
