//
//  view3.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct informationGuideView: View {
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
                .padding()
                Spacer()
            }
            Divider()
            TabView {
                Text("Hier moet nog iets")
                Text("Vervolgens komt dit")
                Text("Dan dat")
                Text("en nog iets")
                Text("een na laatste")
                HStack {
                    Text("Tadaa")
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Dismiss")
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle())
        }
    }
}

struct informationGuideView_Previews: PreviewProvider {
    static var previews: some View {
        informationGuideView()
    }
}
