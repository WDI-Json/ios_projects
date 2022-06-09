//
//  LabelledDivider.swift
//  appclone112app
//
//  Created by Wouter on 13/05/2022.
//

import SwiftUI


struct LabelledDivider: View {
    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String, horizontalPadding: CGFloat = 20, color: Color = .black) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
                .bold()
            line
        }
    }

    var line: some View {
        VStack { Divider().background(.gray) }.padding(horizontalPadding)
    }
}

struct LabelledDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelledDivider(label:"or")
    }
}
