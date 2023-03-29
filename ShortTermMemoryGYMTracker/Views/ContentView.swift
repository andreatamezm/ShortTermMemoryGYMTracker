//
//  ContentView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/27/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authManager = AuthenticationManager()
    @State private var isLoggedIn = false
    @State private var username = ""
    
    var body: some View {
        if isLoggedIn {
            HomeView(isLoggedIn: $isLoggedIn, username: username)
        } else {
            AuthenticationView(authManager: authManager, onLogin: {
                isLoggedIn = true
                username = $0
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
