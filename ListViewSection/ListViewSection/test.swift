//
//  test.swift
//  ListViewSection
//
//  Created by Wouter on 11/10/2022.
//

import SwiftUI

struct MyRadioButton: View {
    let id: Int
    @Binding var currentlySelectedId: Int
    var body: some View {
        Button(action: { self.currentlySelectedId = self.id }, label: { Text("Tap Me!") })
            .foregroundColor(id == currentlySelectedId ? .green : .red)
    }
}


struct MyRadioButtons: View {
    @State var currentlySelectedId: Int = 0
    var body: some View {
        VStack {
            MyRadioButton(id: 1, currentlySelectedId: $currentlySelectedId)
            MyRadioButton(id: 2, currentlySelectedId: $currentlySelectedId)
            MyRadioButton(id: 3, currentlySelectedId: $currentlySelectedId)
            MyRadioButton(id: 4, currentlySelectedId: $currentlySelectedId)
        }
    }
}

struct MyRadioButtons_Previews: PreviewProvider {
    static var previews: some View {
        MyRadioButtons()
    }
}
