import UIKit


//2 урок
//Совместить значения, создать свой тип значения, сделать цикл if-else
let firstScore = 22
let secondScore = 44
let score = firstScore + secondScore
typealias myNewType = Bool
typealias mySecondType = Double

var newValue: myNewType = false
var secondNewValue: mySecondType = 2.5

let a = 35
let b = 46

var newOne = (a+b)*2+a/b
if newOne >= 200 {
    print("Too much")
} else {
    print("The score is \(newOne)")
}
