//
//  Avatar.swift
//  GeometryReaderCards
//
//  Created by Wouter on 06/09/2022.
//

import SwiftUI

struct Avatar: View {
    private var defaultColor: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .primary, .secondary ]
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "square.fill")
                .imageScale(.medium)
                .font(.system(size: 56))
                .foregroundColor(defaultColor.randomElement())
            Text(getInitials(name: name))
                .foregroundColor(.white)
        }
        .frame(width: 56, height: 56)
    }
    
    private func getInitials(name: String?) -> String {
        if let name = name {
            var abbreviatedName: [String] = []
            let cleanedName = name.withoutPunctuations
            for name in cleanedName.components(separatedBy: " ") {
                if let letter = name.first {
                    abbreviatedName.append("\(letter)")
                }
            }
            return abbreviatedName.joined()
        }
        return ""
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Avatar(name: "Wouter Dijks")
            Avatar(name: "Sander ten Brinke")
            Avatar(name: "Julian van 't Veld")
            Avatar(name: "Shanna van Grevengoed")
            Avatar(name: "Jeffrey Huis in 't veld")
            Avatar(name: "Jeroen Ekkelkamp")
            Avatar(name: "Maico van den Brink")
        }
    }
}

extension String {
    func localizedString(comment: String = "") -> String {
        NSLocalizedString(self, comment: comment)
    }
    
    var withoutPunctuations: String {
        return self.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "")
    }
}
