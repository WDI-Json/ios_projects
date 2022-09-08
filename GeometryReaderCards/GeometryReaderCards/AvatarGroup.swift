//
//  AvatarGroup.swift
//  GeometryReaderCards
//
//  Created by Wouter on 06/09/2022.
//

import SwiftUI

struct AvatarGroup: View {
    //fiction names NOT REAL :)
    let avatarArray = [
        "Willem PietjePuk",
        "Bert ten Brood",
        "Julian van 't Meeren",
        "Buddy van Aarsengoed",
        "Sean Kluis in 't veld",
        "Jaro Eekkelkamper",
        "Frederik van Oorsouw",
        "Ricciardo Schuurman",
        "Max van Verstappen",
        "Leonardo Di Firenze",
        "Maximillian Kievitsky"]
    @State var maxItemsForGroup: Int = 0
    let maxItems: Int = 11
    var spacing: CGFloat = 20
    @State var isViewDisplayed = false
    var body: some View {
        GeometryReader { geometry in
            HStack {
                    ForEach(
                        avatarArray[0..<getMaxItemsForGroup(availableSize: geometry.size.width)],
                        id: \.self)
                    { name in
                            Avatar(name: name)
                    }
                    LeftoverAvatar(count: avatarArray.count - maxItemsForGroup)
                        .frame(width: 56, height: 56)
                }
        }
    }
    
    private func getMaxItemsForGroup(availableSize: CGFloat) -> Int {
        var fittingCount = Int((availableSize - spacing / (56 + spacing)))
        fittingCount = fittingCount < maxItems ? fittingCount : maxItems
        self.maxItemsForGroup = fittingCount
        return fittingCount
    }
}

struct AvatarGroup_Previews: PreviewProvider {
    static var previews: some View {
        AvatarGroup()
    }
}









