//
//  StatusCounterView.swift
//  viewsWithState
//
//  Created by Wouter on 28/04/2022.
//

import SwiftUI

struct StatusCounterView: View {
    @StateObject var state: AppState
    
    var body: some View {
        Text("The current number is  \(self.state.getState())")
    }
}

struct StatusCounterView_Previews: PreviewProvider {
    static var previews: some View {
        StatusCounterView(state: AppState())
    }
}
