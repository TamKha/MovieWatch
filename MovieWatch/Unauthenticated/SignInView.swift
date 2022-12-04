//
//  SignInView.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import SwiftUI

struct SignInView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    @State var email = ""
    @State var passWord = ""
    
    var body: some View {
        ZStack{
            Color.indigo.ignoresSafeArea()
            
            VStack{
                Text("MovieWatch").font(.system(size: 40)).bold().foregroundColor(.white.opacity(0.3))
                
                VStack(alignment: .leading){
                    Text("Email:").foregroundColor(.white)
                    TextField("", text: $email).textFieldStyle(.roundedBorder).padding(.bottom)
                    Text("Password:").foregroundColor(.white)
                    SecureField("", text: $passWord).textFieldStyle(.roundedBorder)
                }.frame(width: 330).padding()
                
                Button {
                    
                    if email != "" && passWord != "" {
                        dbConnection.SignInUser(email: email, passWord: passWord)
                    }
                } label: {
                    Text("Sign In").padding().background(.white).cornerRadius(7).foregroundColor(.indigo)
                }
                
                Button("Sign Up") {
                    
                    if email != "" && passWord != "" {
                        dbConnection.SignUpUser(email: email, passWord: passWord)
                    }
                }.foregroundColor(.white)

                
            }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView().environmentObject(DatabaseConnection())
    }
}
