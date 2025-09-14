import Cocoa
var greeting = "Yes"
print(greeting)
let day = "wednesday"
print("today is \(day)")
// Game score
let levelScore = 10
var gameScore = 0

gameScore = gameScore + levelScore
print("The gamescore is: \(gameScore) ")

var levelBonusScore = 10.0
levelBonusScore = 20
print("The level bonus score is: \(levelBonusScore)")
gameScore += Int(levelBonusScore)
print("The game final score is \(gameScore)")

/**
 Create a swift program that declares three variables to store your
 name, age, city.
 Then use print() and string interpolation to display a sentence introducing yourself
 */
let myName = "Emiliano Magana"
let myAge = 26.0
let myCity = "Mexicali"
print("Hello, my name is \(myName), I am \(myAge) years old and I am from \(myCity)")

/**
 Swift data types
 */
let dishName:String = "Pasta"
var price:Double = 19.99
var inStock:Bool = true
let qty:Int = 3


