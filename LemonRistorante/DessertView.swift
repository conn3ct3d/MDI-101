//
//  DessertView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/21/25.
//

import SwiftUI

struct DessertView: View {
    @Environment(\.dismiss) var dismiss
    let dessertMenuItems = [
            DessertItem(
                name:"Cheescake Slice",
                description:"Rich and Creamy Cheesecake",
                price:4.99,
                imageName: "birthday.cake.fill"
            ),
            DessertItem(
                name:"Churro",
                description:"Fried dough with cinnamon sugar",
                price:2.99,
                imageName: "birthday.cake.fill"
            ),
            DessertItem(
                name:"Napolitano Icecream Bowl",
                description:"A classic trio of flavors",
                price:5.99,
                imageName:"birthday.cake.fill"
            ),
    ]
    
    
    var body: some View {
        NavigationView{
            List(dessertMenuItems) { dessert in
                HStack(spacing:16){
                    Image(systemName:dessert.imageName)
                        .font(.title)
                        .frame(width:50, height:50)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius:10))
                    
                    VStack(alignment:.leading,spacing:5){
                    Text(dessert.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(dessert.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    }
                    
                    Spacer()
                    
                    Text(String(format:"%.2f", dessert.price))
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                }
                .padding(.vertical, 5)
            }
            .listStyle(.plain)
            .navigationTitle("Desserts")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DessertView()
}
