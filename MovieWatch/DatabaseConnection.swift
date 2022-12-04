//
//  DatabaseConnection.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestoreSwift


class DatabaseConnection: ObservableObject {
    
    private var db = Firestore.firestore()
    
   
    @Published var movieList = [MovieModel]()
    @Published var currentUser: User?
    @Published var userLoggedIn = false
    
    private var movieListener: ListenerRegistration?
    
    // Init körs direkt när klassen skapas
    init(){
        Auth.auth().addStateDidChangeListener { auth, user in
            
            if let user = user {
                
                // Signed in user
                self.userLoggedIn = true
                self.currentUser = user
                self.startListeningToDB()
            }else{
                
                // Signed out user
                self.userLoggedIn = false
                self.currentUser = nil
                self.StopListeningToDB()
                
            }
        }
    }
    
    func saveRating(rating: Int){
        
        if let currentUser = currentUser {
            do {
                try db.collection("Movies").document(currentUser.uid).updateData(["rating": FieldValue.arrayUnion([Firestore.Encoder().encode(rating)])])
            }catch{
                print("Error saving rating")
            }
        }
    }
    
    func StopListeningToDB(){
        
        if let movieListener = movieListener {
            movieListener.remove()
        }
        movieListener = nil
    }
    
    
    func startListeningToDB(){
        
        movieListener = db.collection("Movies").addSnapshotListener {
            snapshot, error in
            
            if let error = error {
                print("Error getting movie. \(error.localizedDescription)")
                return
            }
            
            guard let snapshot = snapshot else {
                return
            }
            
            self.movieList = []
            
            for document in snapshot.documents {
                
                let result = Result{
                    try document.data(as: MovieModel.self)
                }
                
                switch result {
                case .success(let movie):
                    self.movieList.append(movie)
                    break
                case .failure(let error):
                    print("Error occured getting movies \(error.localizedDescription)")
                    break
                }
            }
        }
    }
    
    func SignOut(){
        
        do{
            try Auth.auth().signOut()
        }catch{
            print("Error logging out.")
        }
        
    }
    
    func SignInUser(email: String, passWord: String){
        Auth.auth().signIn(withEmail: email, password: passWord) {
            authDataResult, error in
            
            if let error = error {
                print("Error signing in user. \(error.localizedDescription)")
            }
        }
        
    }
    
    func SignUpUser(email: String, passWord: String){
        Auth.auth().createUser(withEmail: email, password: passWord) {
            authDataResult, error in
            
            if let error = error {
                print("Error sign up user. \(error.localizedDescription)")
                return
            }
            
//            if let authDataResult = authDataResult {
//
//            }
            
            
            
        }
        
    }
    
    
}
