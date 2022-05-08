//
//  AppState.swift
//  KataTabbarRehearsal
//
//  Created by Wouter on 06/05/2022.
//

import Foundation
import Combine

class AppState: ObservableObject {
    @Published var count: Int = 0
    @Published var selectedTab = TabItems.editor
}

enum TabItems: Hashable {
    case editor, notes, share, settings
}
