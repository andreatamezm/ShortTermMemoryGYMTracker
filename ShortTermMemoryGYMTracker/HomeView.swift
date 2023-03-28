//
//  HomeView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/28/23.
//

import SwiftUI

struct HomeView: View {
    @Binding var isLoggedIn: Bool
    @State private var showSettings = false
    let username: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Hello, \(username)")
                    .font(.largeTitle)
                    .padding()
                
                Spacer()
                
                Button(action: {
                    // This will be the action for the add button
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .navigationBarItems(leading:
                Button(action: {
                    showSettings.toggle()
                }) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
            )
            .sheet(isPresented: $showSettings) {
                SettingsView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(isLoggedIn: .constant(true), username: "User")
    }
}
