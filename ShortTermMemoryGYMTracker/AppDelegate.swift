//
//  AppDelegate.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import UIKit
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Configure Firebase
        FirebaseApp.configure()
        
        return true
    }

    // ... other methods
}
