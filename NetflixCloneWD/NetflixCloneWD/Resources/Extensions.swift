//
//  Extensions.swift
//  NetflixCloneWD
//
//  Created by Wouter on 02/06/2022.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
