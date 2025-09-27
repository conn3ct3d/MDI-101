//
//  MenuView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/17/25.
//

import SwiftUI

struct MenuView: View {
    
    let menuItems = [
        MenuItem(name:"Gourmet Burger", description:"Angus beef, cheddar, and our special sauce.", price:14.99, imageName:"hamburger.fill"),
        MenuItem(name:"Crispy Fries", description:"A perfect side for any dish", price:4.50, imageName:"frenchfries.fill"),
        MenuItem(name:"Garden Salad", description:"Fresh greens and a light vinaigrette.", price:17.99, imageName:"leaf.fill"),
        MenuItem(name:"Ribeye Steak", description:"H12oz cut served with mashed potatoes.", price:4.99, imageName:"steak.fill"),
    ]

    // filtering: user must be able to filter and only show premium items.
    // average price should reflect premium items if filtered
    
    
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
    @State private var showPremium:Bool = false
    
    // notes on computed properties
    // var propertyName: Type{
//      return a calculated value
//      }
    
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
            VStack(spacing:5){
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
        }
    }
}

#Preview {
    MenuView()
}
