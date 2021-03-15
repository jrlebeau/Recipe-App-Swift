//
//  Ingridents.swift
//  recipe list app
//
//  Created by James Lebeau on 3/15/21.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    var name:String
    var num:Int?
    var donom:Int?
    var unit:String?
    
}
