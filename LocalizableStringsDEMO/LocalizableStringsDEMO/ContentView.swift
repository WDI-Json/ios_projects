//
//  ContentView.swift
//  LocalizableStringsDEMO
//
//  Created by Wouter on 17/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List{
                Text("listItemtext1".localizedString())
                    .padding()
                Text("listItemtext2".localizedString())
                    .padding()
                Text("listItemtext3".localizedString())
                    .padding()
            }
            .navigationTitle("title".localizedString())
        }
    }
}

extension String {

    func localizedString(comment: String = "") -> String {
        NSLocalizedString(self, comment: comment)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
