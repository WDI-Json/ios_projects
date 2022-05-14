//
//  ViewExtension.swift
//  appclone112app
//
//  Created by Wouter on 14/05/2022.
//

import SwiftUI

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}
