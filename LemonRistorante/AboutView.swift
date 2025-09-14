//
//  AboutView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/10/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Welcome to Lemon Ristorante!")
                .font(.title)
                .padding()
                
            Image("littleLemonLogo")
                .resizable()
                .scaledToFit()
                .frame(maxHeight:200)
        }
        .navigationTitle("About Us")
    }
}
#Preview {
    AboutView()
}
