//
//  LeftoverAvatar.swift
//  GeometryReaderCards
//
//  Created by Wouter on 07/09/2022.
//

import SwiftUI

struct LeftoverAvatar: View {
    let count: Int
    
    init(count: Int) {
        self.count = count
    }
    var body: some View {
        ZStack {
            Image(systemName: "square.fill")
                .imageScale(.medium)
                .font(.system(size: 48))
                .foregroundColor(.gray)
            Text("+ \(count)")
                .foregroundColor(.black)
        }
        .frame(width: 48, height: 48)
    }
}

struct LeftoverAvatar_Previews: PreviewProvider {
    static var previews: some View {
        LeftoverAvatar(count: 7)
    }
}
