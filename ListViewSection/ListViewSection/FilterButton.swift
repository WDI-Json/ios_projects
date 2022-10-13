//
//  FilterButton.swift
//  ListViewSection
//
//  Created by Wouter on 10/10/2022.
//

import SwiftUI

import Foundation
import SwiftUI

private enum ViewTraits {
    static let minSpacerLength: CGFloat = 24
    static let frameLengthHeight: CGFloat = 24
    static let fontWeight: CGFloat = 14
    static let defaultRadius: CGFloat = 16
}

struct FilterButton: View {
    var buttonText: String
    @State var isSelected = false

    private var textColor: Color  {
        isSelected ? .white : .black
    }
    private var shapeColor: Color {
        isSelected ? .black : .gray
    }

    private let leadingIcon = Image(systemName: "person")

    var body: some View {
        Button(action: {
            self.isSelected.toggle()
        })
        {
            HStack(alignment: .center) {
                Spacer(minLength: ViewTraits.minSpacerLength)
                if let image = leadingIcon, isSelected {
                    image
                        .resizable()
                        .frame(
                            width: ViewTraits.frameLengthHeight,
                            height: ViewTraits.frameLengthHeight,
                            alignment: .leading
                        )
                        .foregroundColor(textColor)
                }
                Text(buttonText)
                    .fontWeight(.medium)
                    .padding(.vertical, 8)
                Spacer(minLength: ViewTraits.minSpacerLength)
            }
            .foregroundColor(textColor)
            .background (
                ZStack {
                    if isSelected {
                        RoundedRectangle(cornerRadius: 16, style: .circular)
                            .foregroundColor(shapeColor)
                    } else {
                        RoundedRectangle(cornerRadius: 16, style: .circular)
                            .stroke(shapeColor, lineWidth: 2)
                    }
                }
            )
        }
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FilterButton(buttonText: "Staff", isSelected: false)
            FilterButton(buttonText: "Kantoortuin", isSelected: true)
        }
    }
}

