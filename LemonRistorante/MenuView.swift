//
//  MenuView.swift
//  LemonRistorante
//
//  Created by Emiliano on 9/17/25.
//

import SwiftUI

struct MenuView: View {
    
    let menuItems = [
        MenuItem(name: "Gourmet Burger", description: "Angus beef, cheddar, and our special sauce.", price: 14.99, imageName: "hamburger.fill"),
        MenuItem(name: "Crispy Fries", description: "A perfect side for any dish.", price: 4.50, imageName: "frenchfries.fill"),
        MenuItem(name: "Garden Salad", description: "Fresh greens and a light vinaigrette.", price: 9.99, imageName: "leaf.fill"),
        MenuItem(name: "Ribeye Steak", description: "12oz cut served with mashed potatoes.", price: 24.99, imageName: "steak.fill"),
        MenuItem(name: "Grilled Salmon", description: "Served with asparagus and lemon butter sauce.", price: 22.99, imageName: "fish.fill"),
        MenuItem(name: "Chicken Parmesan", description: "Breaded chicken with marinara and mozzarella.", price: 18.50, imageName: "bird.fill"),
        MenuItem(name: "Margherita Pizza", description: "Fresh mozzarella, tomatoes, and basil.", price: 15.99, imageName: "circle.grid.3x3.fill"),
        MenuItem(name: "Spaghetti Carbonara", description: "Classic pasta with egg, cheese, and pancetta.", price: 16.50, imageName: "fork.knife"),
        MenuItem(name: "Tomato Basil Soup", description: "Creamy tomato soup with fresh basil.", price: 7.99, imageName: "cup.and.saucer.fill"),
        MenuItem(name: "Bruschetta", description: "Toasted bread with tomatoes, garlic, and basil.", price: 8.99, imageName: "rectangle.grid.1x2.fill"),
        MenuItem(name: "Chocolate Lava Cake", description: "Warm chocolate cake with a molten center.", price: 9.50, imageName: "birthday.cake.fill"),
        MenuItem(name: "Cheesecake", description: "Creamy New York style cheesecake.", price: 8.50, imageName: "square.fill"),
        MenuItem(name: "House Red Wine", description: "A glass of our finest Cabernet Sauvignon.", price: 11.00, imageName: "wineglass.fill"),
        MenuItem(name: "Fresh Lemonade", description: "House-made with fresh lemons.", price: 3.50, imageName: "drop.fill"),
        MenuItem(name: "Iced Tea", description: "Freshly brewed black tea.", price: 3.25, imageName: "mug.fill")
    ]
    
    // filtering: user must be able to filter and only show premium items.
    // average price should reflect premium items if filtered
    
    // computed property to know which items should be on display
    var itemsOnDisplay: [MenuItem] {
        var items = menuItems
        if showPremium{
            items = items.filter { $0.price >= 10}
        }
        return items.sorted { $0.price < $1.price }
    }
    
    // summary calculations should now operate from `displayed.items`
    
    var premiumCount: Int{
        itemsOnDisplay.filter{$0.price>=10}.count
    }
    
    var regularCount: Int{
        itemsOnDisplay.filter{$0.price < 10}.count
    }
    
    var totalPrice: Double {
        itemsOnDisplay.reduce(0.0) { accumulator, currentItem in
            accumulator + currentItem.price
        }
    }
    
    var averagePrice:Double{
        guard !itemsOnDisplay.isEmpty else { return 0.0 }
        return totalPrice / Double(itemsOnDisplay.count)
    }
    
    //@State private var showThankYouMessage:Bool = false
    @State private var showDesserts:Bool = false
    @State private var showPremium:Bool = false
    
    // structure of computed properties (arrow func?)
    // var propertyName: Type{
    // logic logic logic
    // return a calculated value
    // }

    
    var body: some View {
        VStack{
            HStack{
                Image(systemName:"fork.knife")
                    .foregroundColor(.orange)
                    .font(.system(size:32))
                
                Text("Lemon Ristorante Menu")
                    .font(.title)
            }
            .padding()
            
            Text("Average price: $\(averagePrice, specifier:"%.2f")")
                .foregroundColor(.gray)
                .font(.title3)
            
            VStack(spacing:15){
                Toggle("Show premium items only", isOn:$showPremium)
                    .padding(.horizontal)
            }
            
                Button("Switch to Desserts 🍰"){
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
        
        List{
            Section(header: Text("Showing \(itemsOnDisplay.count) items")){
                ForEach(itemsOnDisplay){
                    item in MenuItemView(item:item)
                }
            }
        }
        
        
            Text("Premium: \(premiumCount) | Regular: \(regularCount) | total: $\(totalPrice, specifier:"%.2f")")
                .padding()
                .background(.yellow.opacity(0.2))
                .cornerRadius(8)
                .padding(.bottom)
        }
    }

#Preview {
    MenuView()
}
