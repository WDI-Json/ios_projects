//
//  ContentView.swift
//  KataTabbarRehearsal
//
//  Created by Wouter on 06/05/2022.
//

import SwiftUI


struct ContentView: View {
    

    
    @StateObject var state: AppState
    
    var body: some View {
        TabView(selection: $state.selectedTab) {
            CounterView(state: self.state)
                .tabItem {
                    Image(systemName: "phone.fill")
                    Text("First Tab")
                }.tag(TabItems.editor)
            
            SomeSecondView(selectedTab: $state.selectedTab)
                .tabItem {
                    Image(systemName: "tv.fill")
                    Text("Second Tab")
                }.tag(TabItems.notes)
            
            TodoView()
                .tabItem {
                    Label("To-Do", systemImage: "list.bullet")
                    Text("To-Do")
                }.tag(TabItems.share)
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                    Text("Settings")
                }.tag(TabItems.settings)
            
            ShareView()
                .tabItem {
                    Label("Share", systemImage: "square.and.arrow.up")
                    Text("Share")
                }.tag(TabItems.editor)
            
            PrivateNotesView()
                .tabItem {
                    Label("Private", systemImage: "lock.doc")
                    Text("Private")
                }.tag(TabItems.editor)
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
    @Binding var selectedTab: TabItems
    
    var body: some View {
        NavigationView {
            List{
                Text("item")
                Text("item")
                Text("item")
                Button("goto settings tab!") {
                    selectedTab = TabItems.settings
                }
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
