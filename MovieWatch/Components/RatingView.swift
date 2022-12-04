//
//  RatingView.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-30.
//

import SwiftUI

struct RatingView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
   
    @State var rating: Int
    
    var maxRating = 5
    var unTapped = Image(systemName: "star")
    var tapped = Image(systemName: "star.fill")
    var colored = Color.yellow
    var unColored = Color.gray
    
    func showStar(for number: Int) -> Image {
        if number > rating {
            return unTapped
        }else{
            return tapped
        }
    }
    

    var body: some View {
        
        HStack{
          
            ForEach(1...maxRating, id: \.self) { number in
                showStar(for: number)
                    .foregroundColor(number <= rating ? colored : unColored).onTapGesture {
                        rating = number
                        dbConnection.saveRating(rating: rating)
                    }
                
            }
                
            }
            
        }
    }


struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4).environmentObject(DatabaseConnection())
    }
}
