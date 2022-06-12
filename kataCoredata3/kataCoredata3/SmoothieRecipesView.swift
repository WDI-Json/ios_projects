//
//  SmoothieRecipesView.swift
//  kataCoredata3
//
//  Created by Wouter on 12/06/2022.
//

import SwiftUI

struct SmoothieRecipesView: View {
    @FetchRequest(sortDescriptors: []) var recipes: FetchedResults<Recipe>
    @Environment(\.managedObjectContext) var moc
    var body: some View {
        NavigationView {
            List {
                ForEach(recipes) {recipe in
                    Text(recipe.name ?? "Unknown character")
                    Text("Ingredients: \(recipe.ingredients ?? "Not Known")")
                }
                .onDelete(perform: removeRecipe)
            }
            .toolbar {
                EditButton()
            }
        }
        .navigationTitle("Recipes")
    }
    func removeRecipe(at offsets: IndexSet) {
        for index in offsets {
            let recipe = recipes[index]
            moc.delete(recipe)
        }
    }
}

struct SmoothieRecipesView_Previews: PreviewProvider {
    static var previews: some View {
        SmoothieRecipesView()
    }
}
