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
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.donom ?? 1
        var wholePortions = 0
        if ingredient.num != nil {
            
            denominator = denominator * recipeServing
            
            numerator = targetServing * numerator
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
                
            }
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator) / \(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }

            }
            portion += ingredient.num == nil && ingredient.donom == nil ? "" : " "
            
            return portion + " " + unit
        }
        return portion
    }
}
