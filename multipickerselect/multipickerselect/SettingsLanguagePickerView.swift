//
//  SettingsLanguagePickerView.swift
//  multipickerselect
//
//  Created by Wouter on 17/11/2022.
//

import SwiftUI

struct SettingsLanguagePickerView: View {
    @State private var selections = [Language]()

    @ObservedObject var preferedLanguages: PreferedLanguages

    init(_ preferedLanguages: PreferedLanguages) {
        self.preferedLanguages = preferedLanguages
    }

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Choose prefered languages")) {
                    ForEach(Language.allCases) { item in
                        MultipleSelectionRow(title: item.literal, isSelected: self.selections.contains(item)) {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            }
                            else {
                                self.selections.append(item)
                            }
                        }
                    }

                }
            }
            .onAppear(perform: { self.selections = self.preferedLanguages.languages })
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Languages", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.preferedLanguages.languages = self.selections
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("OK")
                }
            )
        }
    }
}

struct SettingsLanguagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLanguagePickerView(PreferedLanguages())
    }
}
