//
//  SettingsView.swift
//  ShortTermMemoryGYMTracker
//
//  Created by Andrea Tamez on 3/28/23.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isLoggedIn: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button("Logout") {
                isLoggedIn = false
                presentationMode.wrappedValue.dismiss()
            }
            Spacer()
        }
        .padding()
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isLoggedIn: .constant(true))
    }
}
