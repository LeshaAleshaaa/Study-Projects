import UIKit

//3) Создать generic для классов, структур, методов, перечислений( по 1-2 формы на каждый).
print("3 ex")
//1 класс
class GenericSlass<T> {
    let somefirstValue: T
    let someSecondValue: T
    
    init(someFirstValue: T, someSecondValue: T) {
        self.somefirstValue = someFirstValue
        self.someSecondValue = someSecondValue
    }
}

let stringClass = GenericSlass(someFirstValue: "Hello", someSecondValue: "Again")
let intClass = GenericSlass(someFirstValue: 123, someSecondValue: 456)

//2 класс
class SecondGenericClass<T> {
    var arrayWithSomething = [T]()
    
    func appendSomething(what: T) -> [T] {
        arrayWithSomething.append(what)
        return arrayWithSomething
    }
}

let someArray = SecondGenericClass<Any>()
someArray.appendSomething(what: "Hello")
someArray.appendSomething(what: 123)

//1 структура
struct GenericStruct<T> {
    let whatToPrint: T
    
    func printThis() {
        print(whatToPrint)
    }
}

let structValue = GenericStruct(whatToPrint: "Print This")
let structSecondValue = GenericStruct(whatToPrint: 12341)
structValue.printThis()
structSecondValue.printThis()

//2 структура
struct SecondGenericStruct<T> {
    var whichValue: T
    
    subscript(index: Int) -> T {
        switch index {
        case 0:
            print("\(whichValue) -  это ваше значение")
            return whichValue
        case 1:
            print(whichValue)
            return whichValue
        default:
            return whichValue
        }
    }
}

let secondStruct = SecondGenericStruct(whichValue: "Hello")
secondStruct[0]
secondStruct[1]

let oneMoreValue = SecondGenericStruct(whichValue: 12341452)
oneMoreValue[0]
oneMoreValue[1]

//1 метод
func justReturn<T>(value: T) -> T {
    return value
}

justReturn(value: 125125)

//2 метод
func appendToArray<T>(value: T) -> [T] {
    var array = [T]()
    array.append(value)
    print(array)
    return array
}

appendToArray(value: "Just Value")
appendToArray(value: 35125412)

//1 перечисление
enum someEnum<value> {
    case first(value)
    case second(value)
    case third(value)
}

let firstValue = someEnum.first("Hello")
let secondValue = someEnum.second(1243124)

//2 перечисление
enum SecondSomeEnum<something> {
    case leftbyInt(something)
    case leftbyString(something)
}

let anotherEnum = SecondSomeEnum.leftbyInt(1231)
let secondAnotherEnum = SecondSomeEnum.leftbyString("1231")


//4) Написать функцию, которая возвращает массив/словарь(на выбор), общий для для последовательностей.
//Для массивов
print("4 ex")
func addAndReturnArray<T>(whichArray: [T], value: T) -> [T] {
    var someArray = whichArray
    someArray.append(value)
    return someArray
}

var firstArray = ["First", "Second", "Third"]
let secondArray = [1, 2, 3]

addAndReturnArray(whichArray: firstArray, value: "Fourth")
addAndReturnArray(whichArray: secondArray, value: 4)
//Для словарей
func addAndReturnDict<T>(whichDict: [T: Any], key: T, value: T) -> [T: Any] {
    var someDict = whichDict
    someDict.updateValue(value, forKey: key)
    return someDict
}

let firstDict = ["1": "Hello", "2": "Again"]
let secondDict = [1: 124, 2: 24124]

addAndReturnDict(whichDict: firstDict, key: "3123", value: "wbvwerbvwe")
addAndReturnDict(whichDict: secondDict, key: 124124, value: 24124123)


//5) Создать класс, который сортирует массивы значений(на ваш выбор) 3 разными способами.
//Для шпаргалки смотрим обсуждение: "РЕАЛИЗАЦИЯ АЛГОРИТМОВ НА ЯЗЫКЕ SWIFT 3".
//Массивы должны быть связаны с универсальным типом в классе.
print("5 ex")
//1 сортировка
class SortingArray<T> {
    //1 сортировка
    func sortByForIn(array: [T]) -> [T] {
        for values in array {
            print(values)
        }
        return array
    }
    
//2 сортировка
//Свой придумал, можно дописать по всем типам )
    func sortByUp(array: [T]) -> [T] {
        var value = array
        value.sort { (first: T, second: T) -> Bool in
            if let f1 = first as? String, let f2 = second as? String {
                return f1.count < f2.count
            } else if let f1 = first as? Int, let f2 = second as? Int {
                return f1 < f2
                
            } else {
                return false
            }
        }
        return value
    }
    
//3 сортировка наоброт
    func sortByDown(array: [T]) -> [T] {
        var value = array
        value.sort { (first: T, second: T) -> Bool in
            if let f1 = first as? String, let f2 = second as? String {
                return f1.count > f2.count
            } else if let f1 = first as? Int, let f2 = second as? Int {
                return f1 > f2
                
            } else {
                return false
            }
        }
        return value
    }
}

let newoneArray = SortingArray<Any>()
newoneArray.sortByForIn(array: [123, "Hello", "123123"])
newoneArray.sortByUp(array: ["Hello","1124124", "Againweqwe"])
newoneArray.sortByDown(array: [1, 6, 3, 45, 32])


//6) Написать класс на свой вкус(любые методы,проперти) универсального типа.Используя extension, расширить класс, добавить сабскрипт.
print("6 ex")
class UniversalClass<T> {
    let firstValue: T
    let secondValue: T
    
    init(firstValue: T, secondValue: T) {
        self.firstValue = firstValue
        self.secondValue = secondValue
    }
    
}

extension UniversalClass {
    func printingAll() {
        print("This is first value: \(firstValue) and this is second value: \(secondValue)")
    }
    
    subscript(index: Int) -> T {
        switch index {
        case 0:
            return firstValue
        case 1:
            return secondValue
        default:
            print("Something goes ne tak, returning first value...")
            return firstValue
        }
    }
}

let universal = UniversalClass(firstValue: 1231, secondValue: 1241234)
universal[0]
universal[3]
