//
//  HomeView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/28/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    let username: String
    
    var body: some View {
        TabView {
            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
            NavigationView {
                LibraryView(isLoggedIn: $isLoggedIn, username: username)
            }
            .tabItem {
                Label("Library", systemImage: "books.vertical")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoggedIn: .constant(true), username: "User")
    }
}
