//
//  MovieCard.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import SwiftUI

struct MovieCard: View {
    
    var movie: MovieModel
    
    
    var body: some View {
        
        
        ZStack{
            
            AsyncImage(url: URL(string: movie.image)) {
                image in
                
                image.resizable()
                
            } placeholder: {
                Text("Loading").foregroundColor(.white)
            }

            
            
        }.frame(width: 150,height: 200).background(.indigo).cornerRadius(10).shadow(radius: 15)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: MovieModel.sampleMovie[0])
    }
}
