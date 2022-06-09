//
//  SettingsView.swift
//  appclone112app
//
//  Created by Wouter on 17/05/2022.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List{
            NavigationLink("Persoonlijke gegevens", destination: PersonalSettings())
            Text("Over 112NL")
            Text("Privacystatement")
            Text("Licenties")
            Text("Bekijk de 112NL app instructies")
            Section(footer: Text("112 appclone made by Wouter Dijks")) {
            }
        }
    }
}
            
struct PersonalSettings: View {
    var body: some View {
        List{
            Text("Naam")
            Text("Telefoonnummer")
            Text("Chat")
            Text("Communicatie")
            Text("Toestemmingen")
        }
        .listStyle(.plain)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
