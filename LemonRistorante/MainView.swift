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
                Text("Welcome Mr.\(userLastName)")
                    .font(.title)
                
                NavigationLink("About Us", destination:AboutView())
            }
            else {
                Text("You are not logged in")
            }
        }
    }
}

#Preview {
    MainView()
}
