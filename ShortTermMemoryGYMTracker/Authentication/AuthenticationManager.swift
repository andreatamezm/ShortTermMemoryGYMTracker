//
//  AuthenticationManager.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticationManager: ObservableObject {
    @Published var currentUser: User?
    
    func signIn(email: String, password: String, completion: @escaping (String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                self.currentUser = result?.user
                let db = Firestore.firestore()
                db.collection("users").document(self.currentUser!.uid).getDocument { document, error in
                    if let error = error {
                        print("Error fetching user data: \(error.localizedDescription)")
                    } else {
                        let username = document?.get("username") as? String ?? "User"
                        completion(username)
                    }
                }
            }
        }
    }
    
    func signUp(email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            } else {
                guard let user = result?.user else { return }
                
                // Save the username in Firestore
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData([
                    "username": username
                ]) { error in
                    if let error = error {
                        print("Error saving username: \(error.localizedDescription)")
                    } else {
                        print("Username saved successfully")
                        self.currentUser = user
                    }
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            currentUser = nil
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
