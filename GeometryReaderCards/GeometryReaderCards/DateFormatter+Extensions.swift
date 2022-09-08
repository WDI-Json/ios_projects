//
//  DateFormatter+Extensions.swift
//  GeometryReaderCards
//
//  Created by Wouter on 01/09/2022.
//

import Foundation

extension DateFormatter {
    public static let formatddMMyy: DateFormatter = {
      let formatter = DateFormatter()
    formatter.timeZone = .current//TimeZone(abbreviation: "UTC")
      formatter.dateFormat = "dd/MM/yy"
      return formatter
   }()
    
    public static let formatEdMMM: DateFormatter = {
       let formatter = DateFormatter()
        formatter.timeZone = .current//TimeZone(abbreviation: "UTC")
       formatter.dateFormat = "E d MMMM"
       return formatter
    }()
    
    public static let formatMMMMyyyy: DateFormatter = {
       let formatter = DateFormatter()
        formatter.timeZone = .current//TimeZone(abbreviation: "UTC")
       formatter.dateFormat = "MMMM yyyy"
       return formatter
    }()
}
