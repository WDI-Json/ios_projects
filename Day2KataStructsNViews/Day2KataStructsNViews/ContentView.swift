//
//  ContentView.swift
//  Day2KataStructsNViews
//
//  Created by Wouter on 28/04/2022.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var viewNumber = 0 {
        didSet{
            self.didChange.send(())
        }
    }
    var didChange =
    PassthroughSubject<Void, Never>()
}

struct SomeOtherView: View {
    var body: some View {
        Text("Your classic Hello, World!")
    }
}

struct ButtonView: View {
    @StateObject var state: AppState
    var body: some View {
        VStack{
            Button("Increment me!", action: {
                self.state.viewNumber += 1
                })
                .padding()
                .border(.black, width: 3)
            Text("\(self.state.viewNumber)")
                .padding()
            Button("Increment me!") {
                self.state.viewNumber -= 1
                }
                .padding()
                .border(.black, width: 3)
            }
        }
}

struct ContentView: View {
    @StateObject var state: AppState
    var body: some View {
        NavigationView{
            List{
                Text("Menu item 1")
                Text("Menu Item 2")
                Text("Menu item 3")
                NavigationLink(destination: SomeOtherView()){
                    Text("Andere keuze")
                }
                NavigationLink(destination: ButtonView(state: self.state)){
                    Text("CounterView")
                }
            }
            .navigationTitle("Menu van vandaag")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(state: AppState())
    }
}

