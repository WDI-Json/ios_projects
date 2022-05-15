//
//  view1.swift
//  appclone112app
//
//  Created by Wouter on 12/05/2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var locationManager = LocationManager()
    var userLatitude: String {
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    var body: some View {
        VStack{
            ZStack{
            PulseAnimation()
            Text("""
             Uw locatie
             \(userLatitude)N
             \(userLongitude)E
             nauwkeurigheid
             23 meter
             """)
            .bold()
            .multilineTextAlignment(.center)
            .padding(125)
            }
            RedPillButton()
            LabelledDivider(label: "of")
            HStack{
                RedCircleButton("politie")
                    .padding()
                RedCircleButton("ambulance")
                    .padding()
                RedCircleButton("brandweer")
                    .padding()
            }
            HStack{
                VStack{
                    Text("Bel 112")
                    Text("Politie")
                        .bold()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                }
                .multilineTextAlignment(.center)
                VStack{
                    Text("Bel 112")
                    Text("Ambulance")
                        .bold()
                        .padding(.horizontal)
                }.multilineTextAlignment(.center)
                VStack{
                    Text("Bel 112")
                    Text("Brandweer")
                        .bold()
                }.multilineTextAlignment(.center)
            }
        }
    }
}




struct view1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
