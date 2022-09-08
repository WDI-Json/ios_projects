//
//  GeometryReaderCardsApp.swift
//  GeometryReaderCards
//
//  Created by Wouter on 08/09/2022.
//

import SwiftUI

@main
struct GeometryReaderCardsApp: App {
    var body: some Scene {
        WindowGroup {
            CalendarCard(date: Date(), isReserved: true, workspaceName: "Kantoor", reservations: 9, seatsAvailable: 12)
        }
    }
}
