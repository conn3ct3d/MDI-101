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
        NavigationView{
            if isLoggedIn == true {
                VStack{
                    Text("Welcome Mr. \(userLastName)")
                        .font(.title)
                    
                    NavigationLink("About Us", destination:ZStack {
                        AboutView()
                    })
                    Button("Logout"){
                        print("You have logged out.")
                        isLoggedIn = false
                        userName = ""
                    }
                }
            }
            else {
                LoginView(isLoggedIn: $isLoggedIn, userName: $userName)
            }
        }
    }
}

#Preview {
    MainView()
}
