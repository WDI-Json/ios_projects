//
//  tca_reducerpointfreeApp.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import SwiftUI

@main
struct tca_reducerpointfreeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(
                    initialValue: AppState(),
                    reducer: logging(activityFeed(appReducer))
                )
            )
        }
    }
}
