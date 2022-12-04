//
//  ContentView.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
   
    
    
    var body: some View {
        
        
        if dbConnection.userLoggedIn{
            
            NavigationStack {
                MovieListView()
            }
        }else{
            NavigationStack {
                SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DatabaseConnection())
    }
}
