//
//  ContentView.swift
//  katacoreData2
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

struct ContentView: View {
    //Toegang tot de managedcontext
    @Environment(\.managedObjectContext) var moc
    
    //Doe een fetch request
    //Geen sortering
    //sla op als array van Student objecten
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List (students) { student in
                //Coredata hanteert alles als optional zelfs al zou je dat in coredata inrichten. Enige wat coredata belangrijk vind is dat er waardes gevuld zijn.
                Text(student.name ?? "Unknown")
            }
            Button("randomStudent") {
                let names: [String] = ["Tom", "Eva", "Enna", "Rosa", "Wouter", "Annemiek"]
                let surnames: [String] = ["Dijks", "Hurink", "Stomphorst", "Attema"]
                
                let firstName = names.randomElement() ?? "geen naam"
                let lastName = surnames.randomElement() ?? "Geen achternaam"
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(firstName) \(lastName)"
                
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
