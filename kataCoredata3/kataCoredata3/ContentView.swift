//
//  ContentView.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    @State private var name: String = "Smoothiename"
    
    var body: some View {
        ZStack() {
            List {
                ForEach(recipes) {recipe in
                    Text(recipe.name ?? "Unknown character")
                    Text("Ingredients: \(recipe.ingredients ?? "Not Known")")
                }.onDelete(perform: removeRecipe)
            }
            VStack(alignment: .trailing) {
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
        }.toolbar {
            EditButton()
        }
    }
    
    func removeRecipe(at offsets: IndexSet) {
        for index in offsets {
            let recipe = recipes[index]
            moc.delete(recipe)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
