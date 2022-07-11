//
//  ContentView.swift
//  MemoryKataStanford
//
//  Created by Wouter on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(0...10, id: \.self) { _ in
                    Card()
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
