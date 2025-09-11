//
//  AboutView.swift
//  LemonRistorante
//
//  Created by mbair on 9/10/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Welcome to Lemon Ristorante!")
                .font(.title)
                .padding()
                
            
            Text("Here there should actually be an image")
                // .resizable()
                // scaledToFit()
                // frame(height:200)
        }
        .navigationTitle("About Us")
    }
}
#Preview {
    AboutView()
}
