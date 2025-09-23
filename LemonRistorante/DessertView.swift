//
//  DessertView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/21/25.
//

import SwiftUI

struct DessertView: View {
    let dessertMenuItems = [
            DessertItem(
                name:"Cheescake Slice",
                description:"Some description",
                price:4.99
            ),
            DessertItem(
                name:"Churro",
                description:"Some description",
                price:2.99
            ),
            DessertItem(
                name:"Napolitano Icecream Bowl",
                description:"Some description",
                price:5.99
            ),
    ]
    
    
    var body: some View {
        NavigationView{
            List(dessertMenuItems) { dessert in
                HStack{
                    Text(dessert.name)
                        .font(.headline)
                    Text(dessert.description).font(.subheadline)
                    Spacer()
                    
                    Text(String(format:"%.2f", dessert.price))
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Desserts")
        }
    }
}

#Preview {
    DessertView()
}
