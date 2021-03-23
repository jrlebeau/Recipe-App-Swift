//
//  RecipeDetailView.swift
//  recipe list app
//
//  Created by James Lebeau on 3/8/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    @State var selectedServingSize = 2
    
    var body: some View {
        
        ScrollView(.vertical) {
        
            VStack (alignment: .leading) {
                
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                Text(recipe.name)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.top, 20)
                    .padding(.leading)
                
                VStack (alignment: .leading){
                    Text("Select your serving size:")
                        .font(Font.custom("Avenir", size: 16))
                    Picker("", selection:$selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width:160)
                }
                .padding()

                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach (recipe.ingredients) { item in
                        let ingredientString = RecipeModel.getPortion(ingredient: item, recipeServing: recipe.servings, targetServing: selectedServingSize)
                            + " "
                            + item.name.lowercased()
                        
                        Text("• " + ingredientString)
                            .font(Font.custom("Avenir", size: 15))

                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        let line = String(index+1) + ". " + recipe.directions[index]
                        Text(line)
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
