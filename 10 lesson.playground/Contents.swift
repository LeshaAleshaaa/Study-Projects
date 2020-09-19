import UIKit

var nameCan = "Анастасия"
var age = 40
var sex = "female"

switch (age, nameCan) {
case (0...18, "Анастасия"):
    print("Too young")
case (18...30 , "Анастасия"):
    print("Yes")
case let (age, name):
    print("\(age) в этом возрасте поздно \(name)")
default:
    print("no")
}


