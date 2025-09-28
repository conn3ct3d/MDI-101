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
                ZStack {
                    Color(.systemGray6)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 18) {
                        
                        Text("Welcome, \(userName) \(userLastName)")
                            .font(.largeTitle)
                            .fontWeight(.light)
                            .padding(.top, 40)
                        
                        Spacer()
                        
                        NavigationLink("Make a Reservation", destination: ReservationForm())
                            .buttonStyle(PrimaryButtonStyle())
                        
                        NavigationLink("See our Menu", destination: MenuView())
                            .buttonStyle(PrimaryButtonStyle())
                        
                        NavigationLink("About Us", destination: AboutView())
                            .buttonStyle(PrimaryButtonStyle())
                        
                        NavigationLink("Our Customers", destination: CustomerView())
                            .buttonStyle(PrimaryButtonStyle())
                        
                        Spacer()
                        
                        Button("Logout") {
                            print("You have logged out.")
                            isLoggedIn = false
                            userName = ""
                            userLastName = ""
                        }
                        .buttonStyle(DestructiveButtonStyle()) // differentiated style
                        .padding(.bottom)
                    }
                    .padding(.horizontal) // horizontal padding
                    .navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                }
            } else {
                
                LoginView(isLoggedIn: $isLoggedIn, userName: $userName)
            }
        }
        .tint(.green)
    }
}


/// main actions button
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0) // Subtle press effect
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

/// distinct styling for destructive actions such as logging out
struct DestructiveButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding()
            .background(.clear)
            .foregroundColor(.red)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.red, lineWidth: 1.5)
            )
    }
}

#Preview {
    MainView()
}
