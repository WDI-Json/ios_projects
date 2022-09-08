//
//  ProgressCircle.swift
//  GeometryReaderCards
//
//  Created by Wouter on 06/09/2022.
//

import SwiftUI

struct ProgressCircle: View {
    private(set) var progressValue: Float = 0.0
    var seatsTaken: Int
    var seatMax: Int
    
    init(seatsTaken: Int, seatMax: Int) {
        self.seatsTaken = seatsTaken
        self.seatMax = seatMax
        progressValue = Float(seatsTaken) / Float(seatMax)
    }
    
    var body: some View {
        HStack {
            Text("\(seatsTaken) / \(seatMax)")
//                .font(Font.interBold(size: 16))
                .foregroundColor(.gray)
                .padding(.leading)
            ProgressBar(progress: progressValue)
                .frame(width: 20.0, height: 20.0)
        }
    }
}
struct ProgressBar: View {
    var progress: Float
    
    init(progress: Float) {
        self.progress = progress
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 4.0)
                .opacity(0.3)
                .foregroundColor(.gray)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(
                    progress == 1.0 ? Color.red :
                        progress >= 0.8 ? Color.orange : Color.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear, value: 0.5)
        }
    }
}

struct ProgressCircle_Previews: PreviewProvider {
    static var previews: some View {
        VStack (alignment: .center) {
        ProgressCircle(seatsTaken: 10, seatMax: 10)
            .frame(width: 100, height: 50)
        ProgressCircle(seatsTaken: 8, seatMax: 10)
            .frame(width: 100, height: 50)
        ProgressCircle(seatsTaken: 3, seatMax: 10)
            .frame(width: 100, height: 50)
        }
    }
}
