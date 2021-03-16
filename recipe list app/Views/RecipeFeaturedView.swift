//
//  RecipeFeaturedView.swift
//  recipe list app
//
//  Created by James Lebeau on 3/16/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
             
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(.largeTitle)
            
            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                VStack(spacing: 0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        .clipped()
                                    Text(model.recipes[index].name)
                                        .padding(5)
                                }
         
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red:0, green: 0, blue: 0, opacity: 0.5), radius: 19, x: -5, y: 5)

                        }
                     }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            VStack (alignment: .leading, spacing: 10) {
                Text("Preperation Time")
                    .font(.headline)
                Text(model.recipes[index].prepTime)
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hartey")
            }
            .padding([.leading, .bottom])
        }

     }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
