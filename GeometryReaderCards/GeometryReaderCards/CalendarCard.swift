//
//  CalendarCard.swift
//  GeometryReaderCards
//
//  Created by Wouter on 06/09/2022.
//

import SwiftUI

struct CalendarCard: View {
    var date: Date
    var isReserved: Bool
    var workspaceName: String
    var reservations: Int
    var seatsAvailable: Int
    
    var body: some View {
        ZStack {
            Color.white
            if isReserved {
                ZStack (alignment: .leading ) {
                    Color.purple
                }
                .frame(width: 16, height: 208)
                .padding(.trailing, 340)
            }
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("\(date.formatToString(using: .formatEdMMM))")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                            .padding()
                        ProgressCircle(seatsTaken: reservations, seatMax: seatsAvailable)
                            .padding(.leading)
                    }
                    Text(workspaceName)
//                        .font(Font.poppinsRegular(size: 13))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                        .padding()
                    AvatarGroup()
                        .padding(.horizontal, 10)
                        .padding()
                }
            }
        }
        .frame(width: 343, height: 208)
        .cornerRadius(24)
        }
    }

struct CalendarCard_Previews: PreviewProvider {
    static var previews: some View {
        
        ZStack {
            Color.gray
            CalendarCard(date: Date(), isReserved: true, workspaceName: "Arcady Kantoor", reservations: 8, seatsAvailable: 12)
        }
    }
}
