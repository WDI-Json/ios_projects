//
//  PulseAnimation.swift
//  appclone112app
//
//  Created by Wouter on 13/05/2022.
//

import SwiftUI

struct PulseAnimation: View {
    @State var animate = false
    @State var fadeInOut = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle().stroke(colourToShow()).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
                Circle().stroke(colourToShow()).frame(width: 200, height: 200).scaleEffect(self.animate ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2.5).repeatForever(autoreverses:true)) {
                            self.animate.toggle()
                            fadeInOut.toggle()
                        }
                    }
            }.opacity(fadeInOut ? 0 : 0.75)
        }
    }
    
    private func colourToShow() -> Color {
        return Color.blue
    }
}

struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation()
    }
}
