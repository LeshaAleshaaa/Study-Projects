import UIKit
// String constants
let first : String = "1"
let second : String = "2"
let third : String = "3"
let fourth : String = "4"
let fifth : String = "5"

let score = first+second+third+fourth+fifth

//score of constants
if Int(score) != nil {
    let scoreInt = Int(first)!+Int(second)!+Int(third)!+Int(fourth)!+Int(fifth)!
    print(scoreInt)
} else {
    print("error")
}

// nil constants
let nil1 : String? = nil
let nil2 : Int? = nil
let nil3 : Double? = nil

//optional constants
let opt1 : String? = "Alexey"
let opt2 : Int? = 22
let opt3 : Double? = 33.5

//my name in for
let myName = "Alex"
for alexName in myName {
    print(alexName)
}

// array of my family
let family = [(name: "Alex", age: 22), (name: "Nastya", age: 30), (name: "Dmitriy", age: 44), (name: "Olga", age: 68)]
for myFamily in family {
    print("Name is \(myFamily.name) and age is \(myFamily.age)")
}

