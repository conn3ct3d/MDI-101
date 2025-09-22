import UIKit
/**
 Structs are custom data types that let you group related values and behaviors together.
 It can contain:
 -Properties (variables, constants)
 -methods
 -initializers
 -computed properties
 -protocols
 Syntax:
 struct StructName {
    var variableName: ElementType
    var otherVarName: ElementType
 }
 */

struct MenuItem {
    var name:String
    var prices:Double
    var description: String
}
struct Dish {
    var name: String
    var price:Double
    func isPremium() -> Bool {
        return price > 10
    }
}
struct Drink{
    var name:String
    var servedCold:Bool
    var size:String
    var isAlc:Bool
}

let coffee = Drink(name:"Capuccino", servedCold:true, size:"S", isAlc:false)
print(coffee)
let greentea = Drink(name:"Green Tea", servedCold:true,size:"M", isAlc:false)
let strawberryLemonade = Drink(name:"Strawberry Lemonade", servedCold:true, size:"L", isAlc:false)
print(strawberryLemonade)
