//
//  ContentView.swift
//  KataTabbarRehearsal
//
//  Created by Wouter on 06/05/2022.
//

import SwiftUI

struct ContentView: View {
    
   enum TabItems: Int {
       case editor, notes, share, settings
   }
    
   @State private var selectedTab = TabItems.editor.rawValue
    @StateObject var state: AppState
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            CounterView(state: self.state)
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }.tag(TabItems.editor.rawValue)
            
            SomeSecondView()
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
                }.tag(TabItems.editor.rawValue)
            
            TodoView()
                .tabItem {
                    Label("To-Do", systemImage: "list.bullet")
                    Text("To-Do")
                }.tag(TabItems.editor.rawValue)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                    Text("Settings")
                }.tag(TabItems.editor.rawValue)
            
            ShareView()
                .tabItem {
                    Label("Share", systemImage: "square.and.arrow.up")
                    Text("Share")
                }.tag(TabItems.editor.rawValue)
            
            PrivateNotesView()
                .tabItem {
                    Label("Private", systemImage: "lock.doc")
                    Text("Private")
                }.tag(TabItems.editor.rawValue)
        }
    }
}
struct ShareView: View{
    var body: some View {
        Text("shareview")
            .padding()
    }
}

struct PrivateNotesView: View{
    var body: some View {
        Text("private notes")
            .padding()
    }
}


struct HelloWorldView: View{
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct SomeSecondView: View{
    var body: some View {
        NavigationView {
            List{
                Text("item")
                Text("item")
                Text("item")
                Text("item")
                Text("item")
            }
            .navigationTitle("Menu")
        }
    }
}

struct TodoView: View{
    var body: some View {
        Text("So many concepts yet to learn!")
            .padding()
    }
}

struct SettingsView: View{
    var body: some View {
        Text("Settings")
            .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}
