//
//  EmptyView.swift
//  ListViewSection
//
//  Created by Wouter on 10/10/2022.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Spacer()
                    .frame(width: 32, height: 0)
                Image(systemName: "calendar")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Er zijn geen reserveringen. Reserveer jouw werkplek door rechtsbovenin het plus icoon te selecteren of in de agenda te kijken.")
                    .multilineTextAlignment(.center)
                    .frame(width: 280)
            }
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [16]))

        }
        .foregroundColor(.gray)
    }

}

struct EmptyView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
