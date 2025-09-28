//
//  LoginView.swift
//  LemonRistorante
//
//  Created by mbair on 9/15/25.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var userName: String
    
    private var isLoginDisabled: Bool {
        userName.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 25) {
                Spacer()
    
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding(.top)
                    
                TextField("Enter your name", text: $userName)
                    .padding(15)
                    .background(Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .textInputAutocapitalization(.words)
                    .submitLabel(.done)
                    
                
                Button("Log In") {
                    if userName == "Michael" || !userName.isEmpty {
                         isLoggedIn = true
                    }
                }
                .buttonStyle(PrimaryButtonStyle())
                .disabled(isLoginDisabled)
                
                
                Spacer()
                Spacer()
            }
            .padding(30)
            .navigationTitle("Login")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.green)
    }
}

//#Preview {
//    LoginView()
//}
