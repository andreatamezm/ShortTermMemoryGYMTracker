//
//  LoginView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Log In", action: signIn)
                .padding()
            
            NavigationLink(destination: SignupView()) {
                Text("Don't have an account? Sign up")
                    .padding(.top, 16)
            }
        }
        .padding()
    }

    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error signing in: \(error.localizedDescription)")
            } else {
                print("User signed in successfully")
                // Navigate to the main app view
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
