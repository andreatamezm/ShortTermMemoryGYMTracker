//
//  SignUpView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import SwiftUI
import FirebaseAuth

struct SignupView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Log In", action: signUp)
                .padding()
            
            NavigationLink(destination: LoginView()) {
                Text("Have an account? Log in")
                    .padding(.top, 16)
            }
        }
        .padding()
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
            } else {
                print("User created successfully")
                // Save the username and navigate to the main app view
            }
        }
    }
}
