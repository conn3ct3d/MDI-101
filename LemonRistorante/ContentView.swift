//
//  ContentView.swift
//  LemonRistorante
//
//  Created by mbair on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("MyLogo")
            Image(systemName: "keyboard")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Lemon Ristorante")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
