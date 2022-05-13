//
//  PulseAnimation.swift
//  appclone112app
//
//  Created by Wouter on 13/05/2022.
//

import SwiftUI

struct PulseAnimation: View {

    var state = 1

    func colourToShow() -> Color {
        return Color.blue
    }

    @State var animate = false
    var body: some View {
        VStack {
            ZStack {
                Circle().stroke(colourToShow().opacity(0.55)).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
                Circle().stroke(colourToShow().opacity(0.75)).frame(width: 220, height: 220).scaleEffect(self.animate ? 1 : 0)
                Circle().stroke(colourToShow().opacity(0.9)).frame(width: 160, height: 160).scaleEffect(self.animate ? 1 : 0)
//                Circle().stroke(colourToShow()).frame(width: 6.25, height: 6.25)
            }
            .onAppear { self.animate.toggle() }
            .animation(Animation.easeInOut(duration: 4.5).repeatForever(autoreverses: true))
        }
    }
}

struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation()
    }
}
