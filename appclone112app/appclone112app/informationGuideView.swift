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
                Text("instructie1")
                Text("instructie2")
                Text("instructie3")
                Text("instructie4")
                Text("instructie5")
                HStack {
                    Text("instructie6")
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
