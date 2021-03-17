//
//  RecipeModel.swift
//  recipe list app
//
//  Created by James Lebeau on 3/4/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServing:Int, targetServing:Int) -> String {
        
        
        return String(targetServing)
    }
}
