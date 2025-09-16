import UIKit
import Foundation

var greeting = "Hello, playground"
func greet(person:String) -> String {
    let greetings = "Hello " + person + "!"
    return greetings
}
let message = greet(person:"Alice")
print(message)

func greet2(person:String, formal:Bool) -> String {
    if formal {
        return "Greetings, " + person
    }
    else {
        return "Hi, " + person
    }
}
print(greet2(person:"John", formal:true))

func calculateTotal(price:Double, qty:Int) -> Double {
    return price*Double(qty)
}
let total = calculateTotal(price:9.99, qty:2)
print(total)

// mini excerise: Create a function deliveryTime(minutes:) that returns "Ready in X minutes"
func deliveryTime(minutes:Float) -> String {
    let timeRoundedUp = Int(ceil(minutes))
    return "Ready in \(timeRoundedUp) minutes!"
}
let deliveryEstimate = deliveryTime(minutes:5.00001)
print(deliveryEstimate)

// Create a function to calculate price + tax and show results
func pricePlusTax(price:Double, tax:Double) -> String {
    var taxPercentile = tax/100
    var netPrice = price+(price*taxPercentile)
    return "You will pay \(netPrice) for that."
}
let iphonePrice = pricePlusTax(price:2000, tax:50)
print(iphonePrice)

