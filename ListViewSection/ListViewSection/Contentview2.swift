//
//  ContentView.swift
//  ListViewSection
//
//  Created by Wouter on 25/08/2022.
//

import SwiftUI

struct ContentView2: View {
    @StateObject var viewmodel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewmodel.dateStructs) { date in
                    Section ( header: Text("Week \(date.weekNumber)")
                        .headerProminence(.increased)) {
                            ForEach(date.dates, id: \.self) { date in
                                NavigationLink(destination: EmptyView())
                                {
                                    CardWithDate(date: date)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(
                                    RoundedRectangle(cornerRadius: 24)
                                        .background(.clear)
                                        .foregroundColor(.red)
                                        .padding(
                                            EdgeInsets(
                                                top: 10,
                                                leading: 0,
                                                bottom: 10,
                                                trailing: 0
                                            )
                                        )
                                )
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
                .padding()
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
}


struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
