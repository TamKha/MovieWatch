//
//  MovieListView.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import SwiftUI

struct MovieListView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    let data = (1...8).map {$0}
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var showToWatch = false
    var filteredMovies: [MovieModel] {
        
        dbConnection.movieList.filter {
            movie in
            (!showToWatch || movie.toWatch)
        }
        
    }
    
    
    var body: some View {
        
        
        ZStack {
            Color.indigo.ignoresSafeArea()
            VStack {
                
                
                Text("Movies").bold().font(.title).shadow(radius: 10)
                .foregroundColor(.white)
                
                Spacer()
                VStack {
                    Toggle(isOn: $showToWatch) {
                        Text("Show Watchlist").foregroundColor(.indigo).bold()
                    }.padding().cornerRadius(15).background(.white.opacity(0.5)).cornerRadius(20)
                }.padding()
                
                ScrollView {
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(filteredMovies){
                            movie in
                            NavigationLink {
                                MovieView(movieModel: movie)
                            } label: {
                                MovieCard(movie: movie)
                            }
                        }
                    }.padding(.top)
                }.padding()
                
                Button {
                    dbConnection.SignOut()
                } label: {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                }.padding(.leading).foregroundColor(.white)
                
                Spacer()
            }

        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView().environmentObject(DatabaseConnection())
    }
}
