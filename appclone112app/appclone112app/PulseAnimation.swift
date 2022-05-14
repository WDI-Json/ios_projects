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
                Circle().stroke(colourToShow().opacity(0.35)).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
                Circle().fill(colourToShow().opacity(0.03)).frame(width: 250, height: 250).scaleEffect(self.animate ? 1 : 0)
                Circle().stroke(colourToShow().opacity(0.15)).frame(width: 200, height: 200).scaleEffect(self.animate ? 1 : 0)
                Circle().stroke(colourToShow().opacity(0.06)).frame(width: 160, height: 160).scaleEffect(self.animate ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 3.0).repeatForever(autoreverses:true)) {
                            self.animate.toggle()
                            
                        }
                    }
                }
            }
        }
    }

struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation()
    }
}
