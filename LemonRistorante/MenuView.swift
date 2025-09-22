//
//  MenuView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/17/25.
//

import SwiftUI

struct MenuView: View {
    // create a dictionary dish:price (6 items)
//    let menuItems = [
//        "Steak":19.99,
//        "Mac and Cheese":7.99,
//        "Shrimp Cocktail":16.99,
//        "A 'literal' block of cheese":40.00,
//        "Spaghetti": 5.99,
//        "Taco":4.99,
//        "Chocolate Cake":5.75,
//    ]
    
    let menuItems = [
        MenuItem(name:"Pizza", description:"Pepperoni", price:14.99),
        MenuItem(name:"Lasagna", description:"Spicy carbonara", price:25.99),
        MenuItem(name:"Alfredo Chicken", description:"Extra creamy sauce", price:17.99),
        MenuItem(name:"Chicken Taco", description:"Hard taco with tasty chicken filling", price:4.99),
        MenuItem(name:"Cheescake Slice", description: "With strawberry topping", price:6.99)
        
    ]
    
    var sortedMenuItems: [MenuItem]{
        menuItems.sorted{$0.price < $1.price}
    }
    
    var premiumCount: Int{
        menuItems.filter{$0.price>=10}.count
    }
    
    var regularCount: Int{
        menuItems.filter{$0.price < 10}.count
    }
    
    var totalPrice: Double{
        let total = menuItems.reduce(0.0){ accumulator, item in
            accumulator+item.price
        }
        return total
    }
    var averagePrice:Double{
        let prices = menuItems.map {
            item in item.price
        }
        let total = prices.reduce(0.0) {
            accumulator, price in accumulator + price
        }
        let average = total/Double(prices.count)
        return average
    }
    
    @State private var showMessage:Bool = false
    @State private var showThankYouMessage:Bool = false
    @State private var showDesserts:Bool = false
    
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
            
            Text("Average price: $\(averagePrice, specifier:"%.2f")")
                .foregroundColor(.gray)
                .font(.title3)
            VStack(spacing:30){
                Toggle("Show a special text", isOn: $showMessage)
                    .padding()
                if showMessage{
                    Text("You've unlocked a surprise.")
                        .font(.title3)
                        .foregroundColor(.green)
                }
                Toggle("Show thank you message", isOn:$showThankYouMessage)
                    .padding()
                if showThankYouMessage {
                    Text("Thanks for visiting Little Lemon")
                        .foregroundColor(.blue)
                        .italic()
                }
                Button("View Desserts"){
                    showDesserts.toggle()
                }
                .padding()
                .background(.green.opacity(0.3))
                .cornerRadius(12)
                .foregroundColor(.black)
                
                .sheet(isPresented:$showDesserts){
                    DessertView()
                }
            }
            List(sortedMenuItems){ item in
                MenuItemView(item:item)
            }
            Text("Premium: \(premiumCount) | Regular: \(regularCount) | total: $\(totalPrice, specifier:"%.2f")")
                .padding()
                .background(.yellow.opacity(0.2))
                .cornerRadius(8)
            
//            List{
//                Text("Main course meals")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                    .textCase(.uppercase)
//                    .kerning(2)
//                    
//                ForEach(menuItems.sorted(by: {$0.key < $1.key}), id: \.key){ (name, price) in
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text(name)
//                                .font(.headline)
//                            Text("$\(price, specifier: "%.2f")")
//                                .foregroundColor(.secondary)
//                        }
//                        Spacer()
//                        
//                        if price > 10{
//                            HStack{
//                                Image(systemName:"star")
//                                    .foregroundColor(.yellow)
//                                Text("Premium")
//                                    .font(.caption)
//                            }
//                            .foregroundColor(.orange)
//                            .padding(6)
//                            .background(Color.orange.opacity(0.2))
//                            .cornerRadius(6)
//                        }
//                        if price <= 7 {
//                            HStack{
//                                Image(systemName:"tag.fill")
//                                Text("VALUE")
//                            }
//                            .font(.caption)
//                                    .foregroundColor(.white)
//                                    .padding(6)
//                                    .background(Color.green.opacity(1))
//                                    .cornerRadius(6)
//                            
//                        }
//                    }
//                    .padding(.vertical, 8)
//                }
//            }
        }
    }
}

#Preview {
    MenuView()
}
