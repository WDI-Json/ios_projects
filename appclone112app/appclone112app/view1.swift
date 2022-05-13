//
//  view1.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct view1: View {
    @StateObject var locationManager = LocationManager()
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
                HStack {
                    Text("""
                         Uw locatie
                         \(userLatitude)N
                         \(userLongitude)E
                         nauwkeurigheid
                         23 meter
                         """)
                    .bold()
                    .multilineTextAlignment(.center)
                }
        .padding(150)
        RedPillButton()
        LabelledDivider(label: "of")
        VStack{
            HStack{
                
                RedCircleButton()
                    .padding()
                RedCircleButton()
                    .padding()
                RedCircleButton()
                    .padding()
            }
            HStack{Text("Politie")
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                Text("Brandweer")
                    .padding(.horizontal)
                Text("Ambulance")
            }
        }
    }
}




struct view1_Previews: PreviewProvider {
    static var previews: some View {
        view1()
    }
}
