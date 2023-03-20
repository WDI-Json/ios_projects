//
//  PrimeAlert.swift
//  tca_reducerpointfree
//
//  Created by Wouter on 09/03/2023.
//

import Foundation

struct PrimeAlert: Identifiable {
    let prime: Int

    var id: Int { prime }
}
