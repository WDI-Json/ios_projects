//
//  InputView.swift
//  ListViewSection
//
//  Created by Wouter on 13/10/2022.
//

import SwiftUI

struct InputView: View {
    @State private var birthDate = Date()
    var strings: [String] = ["Reservering", "Aanwezig"]
    @State private var selection = "Workspace1"
    let workspaces = ["Workspace1", "Workspace2", "Workspace3"]
    @State var isSelected: Bool = true

    init(){
        UITableView.appearance().backgroundColor = .clear
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Nieuwe reservering")
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(strings, id: \.self) { item in
                        FilterButton(buttonText: item)
                    }
                }
            }.padding()
            Form {
                    HStack {
                        DatePicker("", selection: $birthDate, in: ...Date(), displayedComponents: .date)
                            .fixedSize(horizontal: true, vertical: false)
                            .background(.clear)
                            .datePickerStyle(.compact)
                            .padding(2)
                    }
                    VStack {
                        Picker("Select a paint color", selection: $selection) {
                            ForEach(workspaces, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    .padding()
            }
        }
    }


    struct InputView_Previews: PreviewProvider {
        static var previews: some View {
            InputView()
        }
    }
}
