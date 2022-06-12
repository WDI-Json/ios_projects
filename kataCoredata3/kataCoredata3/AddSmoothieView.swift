//
//  AddSmoothieView.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

struct AddSmoothieView: View {
    @Environment(\.managedObjectContext) var moc
    @State private var name: String = "Smoothiename"
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>

    var body: some View {
        Text("Generate smoothie")
            .bold()
            .font(.title)
        VStack {
            TextField("Enter RecipeName", text: $name)
                .padding(.vertical, 10)
                .overlay(Rectangle().frame(height: 2).padding(.top, 35))
                .foregroundColor(.green)
                .padding(10)
            Button("Create Random Smoothie!") {
                let fruits = ["🍌","🍓","🍑", "🍒","🍇","🥭", "🥥", "🫐", "🍈", "🥝", "🍊"]
                let vegetables = ["🥦","🥕","🍠", "🥒","🫑","🍅"]
                let dairy = ["🥛", "🍦"]
                
                var randomRecipe: String = [String]().joined(separator: ", ")
                2.times {
                    randomRecipe.append(fruits.randomElement() ?? "")
                }
                1.times {
                    randomRecipe.append(vegetables.randomElement() ?? "")
                }
                1.times {
                    randomRecipe.append(dairy.randomElement() ?? "")
                }
                
                let recipe = Recipe(context: moc)
                recipe.id = UUID()
                recipe.name = name
                recipe.ingredients = randomRecipe
                
                try? moc.save()
                name = ""
            }
            .frame(width: 175, height: 100)
            .foregroundColor(Color.white)
            .background(Color.green)
            .clipShape(Capsule())
        }
    }
}

struct AddSmoothieView_Previews: PreviewProvider {
    static var previews: some View {
        AddSmoothieView()
    }
}
