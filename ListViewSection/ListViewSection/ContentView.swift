//
//  ContentView.swift
//  ListViewSection
//
//  Created by Wouter on 25/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewmodel.dateDict.keys.sorted(), id: \.self) { weekNumber in
                    Section (
                        header: Text("Week \(weekNumber)")
                            .headerProminence(.increased)) {
                                ForEach(viewmodel.dateDict[weekNumber]!, id: \.self) { date in
                                    CardWithDate(date: date)
                                }
                            }
                }
                
            }
        }
        .navigationTitle("Reservations")
    }
}

func CardWithDate(date: Date) -> some View {

    HStack {
        VStack(alignment: .leading) {
            Text("\(date.formatToString(using: .formatddMMyy))")
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
