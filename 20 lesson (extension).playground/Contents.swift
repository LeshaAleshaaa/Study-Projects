import UIKit

//3)Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
extension String {
    subscript(index: Int) -> String {
        get {
            switch index {
            case 0:
                return self
            case 1:
                return self
            case 2:
                return self
            case 3: return self
            default:
                return ""
            }
        } set {
            let someValue = newValue
            switch index {
            case 0:
                self = self + " " + someValue + " " + "subscript 0"
            case 1:
                self = self + " " + someValue + " " + "subscript 1"
            case 2:
                self = self + " " + someValue + " " + "subscript 2"
            case 3:
                self = self + " " + someValue + " " + "subscript 3"
            default:
                ""
            }
        }
    }
}

var somethingValue = "Hello"
somethingValue[0]
somethingValue[1] = "World"
somethingValue


//4) Расширить Int и добавить 3 метода возведение в квадрат, куб, степень
//4-Расширение с умножением
extension Int {
    //Квадрат
    func square() -> Int {
        return self * self
    }
    //Куб
    func cube() -> Int {
        return self * self * self
    }
    //Степень
    func power(power: Int) -> Int {
        var firstPower = 1
        for _ in 1...power {
            firstPower *= self
        }
        return firstPower
    }
    
}

let someInt = 3
someInt.square()
someInt.cube()
someInt.power(power: 4)


//5-Расширение строки
extension String {
    func addSturname(surname: String) -> String {
        return self + " " + surname
    }
}

let someString = "Alexey"
someString.addSturname(surname: "Smitskiy")


//5)Расширить еще 3 структуры на свой вкус и в коментах обосновать для чего это было сделано
//5-Расширение символа
extension Character {
    func alphabet() {
        switch self {
        case "А":
            print("\(self) - Первая буква алфавита")
        case "Б":
            print("\(self) - Вторая буква алфавита")
        default:
            print("Я не хочу записывать весь алфавит, это расширение для вывода номера буквы в алфавите)")
        }
    }
}

let someSymbol: Character = "А"
someSymbol.alphabet()

//5-Расширение для класса
class JustMe {
    let name: String
    let surname: String
    let age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

extension JustMe {
    func aboutMe() {
        print("Меня зовут \(name) \(surname) и мне \(age)")
    }
}

let alexeyValue = JustMe(name: "Алексей", surname: "Смицкий", age: 22)
alexeyValue.aboutMe()


//6)Добавьте проперти, которое возвращает количество символов в числе
//6-Расширение для показа количества симоволов в числе
extension Int {
    func charCount() {
        let intCout = String(self)
        print("В числе \(self) - \(intCout.count) символов")
    }
}

let intCounting = 345234
intCounting.charCount()


//7)Добавить метод который говорит число положительное или отрицательное
//Метод для Int
extension Int {
    func plusOrMinus() {
        if self >= 1 {
            print("\(self) - положительное число")
        } else if self <= -1 {
            print("\(self) - отрицательное число")
        } else if self == 0 {
            print("\(self) равен нулю")
        } else {
            print("Что-то пошло не так, введите число без запятых")
        }
    }
}

//Метод для Double
extension Double {
    func plusOrMinus() {
        if self >= 1 {
            print("\(self) - положительное число")
        } else if self <= -1 {
            print("\(self) - отрицательное число")
        } else if self == 0 {
            print("\(self) равен нулю")
        } else {
            print("Что-то пошло не так, введите число без запятых")
        }
    }
}

//Метод для Float
extension Float {
    func plusOrMinus() {
        if self >= 1 {
            print("\(self) - положительное число")
        } else if self <= -1 {
            print("\(self) - отрицательное число")
        } else if self == 0 {
            print("\(self) равен нулю")
        } else {
            print("Что-то пошло не так, введите число без запятых")
        }
    }
}
