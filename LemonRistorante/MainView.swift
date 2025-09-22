//
//  MainView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/15/25.
//

import SwiftUI

struct MainView: View {
    @State private var isLoggedIn = false
    @State private var userName = "Michael"
    @State private var userLastName = "Myers"
    
    var body: some View {
        NavigationView {
            // The if/else logic should be inside the NavigationView
            if isLoggedIn { // You can just use "isLoggedIn" instead of "isLoggedIn == true"
                VStack {
                    Text("Welcome Mr. \(userLastName)")
                        .font(.title)
                        .padding()
                    
                    NavigationLink("Make a Reservation", destination: ReservationForm())
                        .padding()
                    
                    NavigationLink("About Us", destination: AboutView())
                        .padding(.bottom) // Added padding for better spacing
                    
                    Button("Logout") {
                        print("You have logged out.")
                        isLoggedIn = false
                        userName = ""
                        // You probably want to clear the last name too
                        userLastName = ""
                    }
                    .padding()
                    
                    Spacer() // Pushes content to the top
                }
                .navigationTitle("Main Menu") // Good to have a title for the logged-in view
                .navigationBarBackButtonHidden(true) // Hides the back button
            } else {
                // This is shown when the user is not logged in
                LoginView(isLoggedIn: $isLoggedIn, userName: $userName)
            }
        }
    }
}
#Preview {
    MainView()
}
