//
//  MenuView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/17/25.
//

import SwiftUI

struct MenuView: View {
    // create a dictionary dish:price (6 items)
    let menuItems = [
        "Steak":19.99,
        "Mac and Cheese":7.99,
        "Shrimp Cocktail":16.99,
        "A 'literal' block of cheese":40.00,
        "Spaghetti": 5.99,
        "Taco":4.99,
        "Chocolate Cake":5.75,
    ]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName:"fork.knife")
                    .foregroundColor(.orange)
                    .font(.system(size:32))
                Text("Today's menu")
                    .font(.title)
            }
            .padding()
            
            List{
                Text("Main course meals")
                    .font(.headline)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .kerning(2)
                    
                ForEach(menuItems.sorted(by: {$0.key < $1.key}), id: \.key){ (name, price) in
                    HStack{
                        VStack(alignment: .leading){
                            Text(name)
                                .font(.headline)
                            Text("$\(price, specifier: "%.2f")")
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        if price > 10{
                            HStack{
                                Image(systemName:"star")
                                    .foregroundColor(.yellow)
                                Text("Premium")
                                    .font(.caption)
                            }
                            .foregroundColor(.orange)
                            .padding(6)
                            .background(Color.orange.opacity(0.2))
                            .cornerRadius(6)
                        }
                        if price <= 7 {
                            HStack{
                                Image(systemName:"tag.fill")
                                Text("VALUE")
                            }
                            .font(.caption)
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.green.opacity(1))
                                    .cornerRadius(6)
                            
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
