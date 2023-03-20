//
//  ContentView.swift
//  multipickerselect
//
//  Created by Wouter on 17/11/2022.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State private var showLanguageSheet = false

    @State private var x = 0

    @ObservedObject var preferedLanguages = PreferedLanguages()

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Language").font(.caption)) {
                        Button(action: {
                            self.showLanguageSheet.toggle()
                        }) {
                            HStack {
                                Text("Choose languages").foregroundColor(Color.black)
                                Spacer()
                                Text("\(preferedLanguages.languages.count)")
                                    .foregroundColor(Color(UIColor.systemGray))
                                    .font(.body)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(UIColor.systemGray4))
                                    .font(Font.body.weight(.medium))

                            }
                        }
                        .sheet(isPresented: $showLanguageSheet) {
                            SettingsLanguagePickerView(self.preferedLanguages)
                        }

                        Picker(selection: $x, label: Text("One item Picker")) {
                           ForEach(0..<10) { x in
                              Text("\(x)")
                           }
                        }

                        NavigationLink(destination: self) {
                            Text("Default navigation link")
                        }
                    }
                }
            }
            .navigationBarTitle("Content")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
