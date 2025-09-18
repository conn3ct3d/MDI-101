import UIKit

let dishes = ["Pizza", "Pasta", "Salad"]
//print(dishes[1])
//var orders = [String]()
//orders.append("Soup")
//orders.append("Burger")

// challenge 1: Create an array with 4 desserts. Print the third dessert.
var desserts = [String]()
desserts.append("Canolli")
desserts.append("Chocolate Mousse")
desserts.append("Cookies & Cream Icecream")
desserts.append("Churros")
print(desserts[2])

let menuPrices: [String:Double] = ["Pizza":12.99, "Salad":19.99, "Pasta":11.99]
print(menuPrices["Pizza"]!)

var stock: [String:Double] = ["Burger":5.00, "Soup":4.00]
//update the value of soup
stock["Soup"] = 4.5
print(stock)

let drinks: [String:Double] = ["Mimosa":14.99, "Tequila Shot": 0.99, "Chocolate Milk": 4.99]
print(drinks["Tequila Shot"]!)
// Add new dictionary and print all values
var ingredients = ["Tomato":3, "Cheese":2, "Potato": 100, "Pepperoni":10, "Mushrooms":0]
for (x, y) in ingredients.sorted(by:{$0.value < $1.value}) {
    print(" \(x), \(y)")
}
// use the dishes array
for k in dishes {
    print("\(k)")
}
// Travel dictionary
let meals = ["Burger": 7.99, "Salad": 5.99]
for (i, j) in meals{
    print("\(i) is \(j)$")
}
// Travel array
let prices2 = [8.0, 12.5, 7.0, 15.0]
for amount in prices2 {
    print("\(amount)")
}

// Filtering using prices2
let premiumItems = prices2.filter{$0 > 10}
print(premiumItems)


