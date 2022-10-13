////
////  ContentView.swift
////  ListViewSection
////
////  Created by Wouter on 25/08/2022.
////

import SwiftUI

struct ContentView: View {
    var strings: [String] = ["Borealis", "Beretuin", "Polaris"]
    @State var isSelected: Bool = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(strings, id: \.self) { item in
                    FilterButton(buttonText: item)
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
