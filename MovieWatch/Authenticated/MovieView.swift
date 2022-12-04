//
//  MovieView.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-25.
//

import SwiftUI

struct MovieView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    var movieModel: MovieModel
    
    var movieIndex: Int {
        
        dbConnection.movieList.firstIndex(where: {$0.id == movieModel.id})!
    }
    
    var body: some View {
        ZStack() {
            Color.indigo
            VStack(){
                ZStack(alignment: .top) {
                    AsyncImage(url: URL(string: movieModel.image)) { image in
                        image.resizable().frame(height:520)
                    } placeholder: {
                        ZStack{
                            Color.indigo
                            Text("Loading...")
                        }
                    }
                    
                }
                
                ScrollView{
                    VStack(alignment: .leading){
                        
                        HStack {
                            Text(movieModel.title).font(.title).bold()
                            WatchButton(isTapped: $dbConnection.movieList[movieIndex].toWatch)
                            RatingView(rating: movieModel.rating)
                            
                            
                        }
                        Spacer()
                        Text(movieModel.description).font(.caption)
                        
                        Spacer()
                    }.padding().foregroundColor(.white)
                }
            }
        }.ignoresSafeArea()
    }
}

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView(movieModel: MovieModel.sampleMovie[0]).environmentObject(DatabaseConnection())
//    }
//}
