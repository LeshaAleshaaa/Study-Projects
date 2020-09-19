import UIKit


func someFunction(a: Int, b: Int = 4) -> Int {
    return a * b
}
let b = someFunction(a: 3)
