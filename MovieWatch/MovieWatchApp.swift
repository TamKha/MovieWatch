//
//  MovieWatchApp.swift
//  MovieWatch
//
//  Created by Tamanna Khan on 2022-11-23.
//

import SwiftUI

import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct MovieWatchApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var dbConnection = DatabaseConnection()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(dbConnection)
        }
    }
}
