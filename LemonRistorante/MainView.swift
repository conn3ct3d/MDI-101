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
            
            if isLoggedIn {
                VStack {
                    Text("Welcome Mr. \(userLastName)")
                        .font(.title)
                        .padding()
                    
                    NavigationLink("Make a Reservation", destination: ReservationForm())
                        .padding()
                    
                    NavigationLink("See our Menu", destination: MenuView())
                        .padding()
                    
                    NavigationLink("About Us", destination: AboutView())
                        .padding(.bottom)
                    
                    Button("Logout") {
                        print("You have logged out.")
                        isLoggedIn = false
                        userName = ""
                        
                        userLastName = ""
                    }
                    .padding()
                    
                    Spacer()
                }
                .navigationTitle("Main Menu")
                .navigationBarBackButtonHidden(true)
            } else {
                
                LoginView(isLoggedIn: $isLoggedIn, userName: $userName)
            }
        }
    }
}
#Preview {
    MainView()
}
