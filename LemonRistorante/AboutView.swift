//
//  AboutView.swift
//  LemonRistorante
//
import SwiftUI

struct AboutView: View {
    let userFirstName = "Michael"
    let userLastName = "Myers"
    @State var orderCount = 10
    @State var clientName:String = ""
    
    var body: some View {
        VStack {
            Text("Hello \(userFirstName),")
                .font(.title)
                .fontWeight(.bold)
                .lineLimit(1)
                .padding()
            
            Text("Welcome to Little Lemon")
                .font(.body)
            
            Image("littleLemonLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 275, height: 170)
            
            Text("You have ordered \(orderCount) times.")
                .padding(.top, 20)
            
            Button("Place a new order") {
                orderCount += 1
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
            Button("Clear my orders"){
                orderCount = 0
            }
            TextField("Enter your name: ", text:$clientName)
                .padding()
                .textFieldStyle(.roundedBorder)
            Text ("Client name is working \(clientName)")
        }
        
        .navigationTitle("About Us")
    }
}

#Preview {
    AboutView()
}
