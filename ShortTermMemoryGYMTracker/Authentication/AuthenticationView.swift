//
//  SignUpView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import SwiftUI

struct AuthenticationView: View {
    @ObservedObject var authManager: AuthenticationManager
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    @State private var isSignup = false
    
    var onLogin: (String) -> Void
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .autocapitalization(.none)
            
            if isSignup {
                TextField("Username", text: $username)
                    .padding()
                    .autocapitalization(.none)
            }
            
            Button(action: {
                if isSignup {
                    authManager.signUp(email: email, password: password, username: username)
                } else {
                    authManager.signIn(email: email, password: password) { username in
                        onLogin(username)
                    }
                }
            }) {
                Text(isSignup ? "Sign Up" : "Log In")
            }
            .padding(.top)
            
            Button(action: {
                isSignup.toggle()
            }) {
                Text(isSignup ? "Already have an account? Log In" : "Don't have an account? Sign up")
                    .padding(.top, 16)
            }
        }
        .padding()
    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authManager: AuthenticationManager(), onLogin: { _ in })
    }
}
