//
//  AboutView.swift
//  LemonRistorante
//
import SwiftUI

struct AboutView: View {
    let userFirstName = "Michael"
    let userLastName = "Myers"
    @State var orderCount = 10
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("About Little Lemon")
                    .font(.largeTitle)
                    .fontWeight(.light)
                
                Text("Your favorite neighborhood restaurant.")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Image("littleLemonLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                    .padding(.bottom)
                
                Text("You have ordered \(orderCount) times.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Button("Place a new order") {
                    orderCount += 1
                }
                .buttonStyle(PrimaryButtonStyle())
                
                Button("Clear my history"){
                    orderCount = 0
                }
                .buttonStyle(DestructiveButtonStyle())
                
                Spacer()
                    .frame(height: 10)
            }
            .padding(.horizontal)
            .navigationTitle("About Us")
            .navigationBarTitleDisplayMode(.inline)
        }
        .tint(.green) 
    }
}

#Preview {
    NavigationView {
        AboutView()
    }
}
