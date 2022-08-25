//
//  ContentView.swift
//  ListViewSection
//
//  Created by Wouter on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                CardWithDate()
                CardWithDate()
                CardWithDate()
            }
            .navigationTitle("Reservations")
        }
    }
    
    func CardWithDate() -> some View {
        return Section(
            header: Text("Week 1")
                .headerProminence(.increased)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Do 25 augustus")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                                .padding(.vertical)
                            Text("Arcady Kantoor")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .padding(.vertical)
                            Image(systemName: "person.crop.square")
                                .imageScale(.medium)
                                .font(.system(size: 60))
                                .padding(.bottom)
                        }
                    }
                    .padding(.horizontal)
                    
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
