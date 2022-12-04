//
//  FavouriteButton.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-25.
//

import SwiftUI

struct WatchButton: View {
    
    @Binding var isTapped: Bool
    
    var body: some View {
        
        Button {
            isTapped.toggle()
        } label: {
            Label("Toggle Favourite", systemImage: isTapped ? "square.and.arrow.down.fill" : "square.and.arrow.down").labelStyle(.iconOnly).foregroundColor(isTapped ? .blue : .gray)
        }
    }
}

struct WatchButton_Previews: PreviewProvider {
    static var previews: some View {
        WatchButton(isTapped: .constant(true))
    }
}
