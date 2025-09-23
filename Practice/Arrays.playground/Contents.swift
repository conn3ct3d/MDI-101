import UIKit

let dishes = ["pizza", "pasta", "soup"]
let iAmDishesToo = ["pizza", "grapes", "icecream"]
print(dishes[0])
print(dishes.count)

var prices = [9.99, 10.50, 6.00]
let total = prices[0] + prices[1] + prices[2]
print(total)
// compare two arrays without looping, return true if repeated, return false if all elements are different
// func (





let desserts = ["Churro", "Cheesecake", "Vanilla Icecream"]
for x in desserts {
    print(x)
}
print()
let calories = [0,150,80,120]
for y in calories where y>100 {
    print("\(y) high calorie drink")
}
print()
let prices2 = [8.50, 12.00, 14.25, 6.75]
for z in prices2 where z>10 {
    print("\(z) is greater than 10")
}
print()
let meals = ["Salad", "Steak", "Burger"]
for meal in meals{
    if meal.contains("a"){ // <<< KEY
        print("Meal with an a: \(meal)")
    }
}
print()
// filter and print only mebnu items that cost less than 10
let mealPrices = [8.99, 12.00, 10.45, 9.00]
let expensiveMeals = mealPrices.filter{$0>10}
for dish in expensiveMeals {
    print(dish)
}
// how many premium dishes are in the array using for in loop (premium is > 10)
var counter = 0
var totalPremium = 0
for price in mealPrices {
    if price > 10 {
        counter += 1
        totalPremium += Int(price)
    }
}
print("You have \(counter) premium meals")
print("The price would be \(totalPremium)$ for all of them")
