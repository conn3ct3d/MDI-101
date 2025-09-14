//
//  ContentView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Image("littleLemonLogo")
                
                Image(systemName: "keyboard")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("Lemon Ristorante")
                    .padding()
                NavigationLink(destination:AboutView()){
                    Text("About")
                        .foregroundStyle(.cyan)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
