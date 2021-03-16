//
//  ContentView.swift
//  recipe list app
//
//  Created by James Lebeau on 3/4/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            
            List(model.recipes) { r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe:r),
                    label: {
                        HStack(spacing: 20.0) {
                            Image(r.image)
                                .resizable()
                                .frame(width: 50.0, height: 50.0, alignment: .center)
                                .scaledToFill()
                                .clipped()
                                .cornerRadius(5)
                            Text(r.name)
                        }

                })
                
              }
            .navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
