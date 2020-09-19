import UIKit

//3) Написать сортировку массива с помощью замыкания, сначала в одну сторону, затем в другую.Вывести всё в консоль.
//Массив чисел
let array = [3, 5, 6, 100, 300, 500, 200, 456, 100, 200]

//Полная версия клоужера
let rightMassive = array.sorted { (firstScore: Int, secondScore: Int) -> Bool in
    return firstScore < secondScore }

// Укороченная версия клоужера
let littleRightMassive = array.sorted { $0 < $1 }

//Вывод в консоль
print("Вывод с помощью полного клоужера: \(rightMassive)")
print("Вывод с помощью укороченного клоужера: \(littleRightMassive)")


//4) Создать метод который запрашивает имена друзей, после этого имена положить в массив. Массив отсортировать по количеству букв в имени.
//Метод по запросу имен друзей и добавлению в массив
var friendsArray = [String]()

func friendsNameRequest(name: String) {
    let friendName = name
    friendsArray.append(friendName)
}

//Добавление друзей в массив
friendsNameRequest(name: "Alexey")
friendsNameRequest(name: "Dmitry")
friendsNameRequest(name: "Nastya")
friendsNameRequest(name: "Kirill")
friendsNameRequest(name: "John")
friendsNameRequest(name: "Mike")
friendsArray

//Сортировка по колличеству букв в имени
let sortedFriends = friendsArray.sorted(by: {$0.count < $1.count})
print("Отсортированные друзья: \(sortedFriends)")


//5) Написать функцию которая будет принимать ключи, выводить ключи и значения словаря (Dictionary). Тип ключа и значения выбирайте сами.

//Пустой словарь
var scoreDict = [String:Int]()

//Функция
func humanScore(humanName: String, humanScore: Int) -> [String:Int] {
    let name = humanName
    let score = humanScore
    scoreDict[name] = score
    print("Человека зовут \(name) и он заработал \(score)")
    
    return scoreDict
}

//Добавление новых значений
humanScore(humanName: "Alexey", humanScore: 35)
humanScore(humanName: "Dmitry", humanScore: 46)
humanScore(humanName: "Kirill", humanScore: 66)
humanScore(humanName: "John", humanScore: 23)


//6) Написать функцию, которая принимает пустые массивы(один строковый, второй - числовой) и проверяет их: если пустой - то добавить значения и вывести в консоль.

var stringArray = [String]()
var intArray = [Int]()
func addValuesToArray(firstArray:[String]?, secondArray:[Int]?, addStringValue: String, addIntValue: Int) ->([String]?,[Int]?) {
    if firstArray?.count == 0 && secondArray?.count == 0 {
        stringArray.append(addStringValue)
        intArray.append(addIntValue)
    } else {
        print("Array is not empty")
    }
    return (firstArray,secondArray)
}

addValuesToArray(firstArray: stringArray, secondArray: intArray, addStringValue: "Hello world", addIntValue: 34534)
addValuesToArray(firstArray: stringArray, secondArray: intArray, addStringValue: "Hello again", addIntValue: 42352)
print(stringArray)
print(intArray)
