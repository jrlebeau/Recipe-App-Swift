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
            
            VStack (alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .padding(.leading)
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))

                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes) { r in
                            
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
                                        
                                        VStack (alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                            
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }

                            })
                            
                        }
                    }
                    .navigationBarHidden(true)
                    .padding(.leading)

                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
