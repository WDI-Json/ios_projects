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
        return "\(locationManager.lastLocation?.coordinate.latitude ?? 0.0)"
    }
    
    var userLongitude: String {
        return "\(locationManager.lastLocation?.coordinate.longitude ?? 0.0)"
    }
    
    var body: some View {
        VStack{
            ZStack{
                PulseAnimation()
                VStack{
                    Text("Uw locatie")
                        .bold()
                        .padding(1)
                    Text("""
             \(getLocationDegreesFrom(latitude: Double(userLatitude)!))
             \(getLocationDegreesFrom(longitude: Double(userLongitude)!))
             """)
                    .bold()
                    .padding(1)
                    .foregroundColor(.blue)
                    .font(Font.system(size: 22, design: .default))
                    Text("nauwkeurigheid")
                    Text("7 meter")
                        .bold()
                }
                .multilineTextAlignment(.center)
            }
            RedPillButton()
            LabelledDivider(label: "of")
            HStack {
                RedCircleButton("politie")
                    .padding()
                RedCircleButton("ambulance")
                    .padding()
                RedCircleButton("brandweer")
                    .padding()
            }
            HStack {
                VStack {
                    Text("Bel 112")
                    Text("Politie")
                        .bold()
                        .padding(.horizontal)
                        .multilineTextAlignment(.center)
                }
                .multilineTextAlignment(.center)
                VStack {
                    Text("Bel 112")
                    Text("Ambulance")
                        .bold()
                        .padding(.horizontal)
                }.multilineTextAlignment(.center)
                VStack {
                    Text("Bel 112")
                    Text("Brandweer")
                        .bold()
                }.multilineTextAlignment(.center)
            }
        }
    }
}

func getLocationDegreesFrom(latitude: Double) -> String {
    var latSeconds = Int(latitude * 3600)
    let latDegrees = latSeconds / 3600
    latSeconds = abs(latSeconds % 3600)
    let latMinutes = latSeconds / 60
    latSeconds %= 60
    return String(
        format: "%d°%d'%d\"%@",
        abs(latDegrees),
        latMinutes,
        latSeconds,
        latDegrees >= 0 ? "N" : "S"
    )
}

func getLocationDegreesFrom(longitude: Double) -> String {
    var longSeconds = Int(longitude * 3600)
    let longDegrees = longSeconds / 3600
    longSeconds = abs(longSeconds % 3600)
    let longMinutes = longSeconds / 60
    longSeconds %= 60
    return String(
        format: "%d°%d'%d\"%@",
        abs(longDegrees),
        longMinutes,
        longSeconds,
        longDegrees >= 0 ? "E" : "W"
    )
}


struct view1_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
