import UIKit

//Функция не принимает и не возвращает
func nothingBack() {
    print("Эта функция ничего не возвращает и не принимает")
}

//Функция принимает, но не возвращает
func addSomething(value: String) {
    print("Эта функция принимает значение \(value)")
}

//Функция принимает и возвращает
func addAll(name: String, age: Int) -> String {
    return "\(name) - \(age) лет"
}

//Вызов функций
let firstFunc: () = nothingBack()
let secondFunc: () = addSomething(value: "какое-то значение")
let thirdFunc: () = print(addAll(name: "Насте", age: 30))

//Массив для записи студентов(Имя, Профессия, Оценка)
var studentsArray = [String]()
var studentsFuncArray = [String]()

//Журнал учителя и функция для добавления студента
var arrayMAssive = [(String,String,Int)]()

func addNewStudent(name: String, profession: String, score: Int) {
    arrayMAssive.append((name,profession,score))
}

//Добавление студента
let studentDmitry: () = addNewStudent(name: "Dmitry", profession: "Programmist", score: 5)
let studentAndrew: () = addNewStudent(name: "Andrew", profession: "Biolog", score: 4)
let studentKirill: () = addNewStudent(name: "Kirill", profession: "Driver", score: 3)
let studentAlexey: () = addNewStudent(name: "Alexey", profession: "Scientist", score: 5)
let studentNastya: () = addNewStudent(name: "Nastya", profession: "Tracker", score: 4)
let studentTima: () = addNewStudent(name: "Tima", profession: "Francer", score: 3)
let studentJohn: () = addNewStudent(name: "John", profession: "Policeman", score: 5)
let studentMike: () = addNewStudent(name: "Mike", profession: "Biolog", score: 4)
let studentSlavik: () = addNewStudent(name: "Slavik", profession: "Pilot", score: 3)
let studentJohnny: () = addNewStudent(name: "Johnny", profession: "Programmist", score: 5)

//Вывод студентов в консоль через цикл for
let studentsScore = arrayMAssive.count
for studentsList in 0..<studentsScore {
    print("Student \(studentsList + 1) its \(arrayMAssive[studentsList])")
}

//Массив и функция, которая принимает имя и фамилию
var namesArray = [(String, String)]()
func nameAndSurname(name: String, surname: String) {
    namesArray.append((name,surname))
}

//Добавление людей
let nameDimon: () = nameAndSurname(name: "Dimon", surname: "Ivanov")
let nameNastya: () = nameAndSurname(name: "Nastya", surname: "Sokolova")
let sortedName = namesArray.count

//Сортировка и вывод в консоль
for sorting in 0..<sortedName {
    print("Human's \(sorting + 1) name is \(namesArray[sorting])")
}

//Вычисление площади круга
func scaleKrug(radius: Int) -> Int {
    return Int(3.14) * (radius^2)
}

let firstKrug = scaleKrug(radius: 25)
let printKrug: () = print("Площадь круга равна \(firstKrug)")


//Словарь с учениками и оценками и вывод в консоль
let dictionary: [String : Any] = ["name" : (firstName: "Andrew", secondName: "Dmitry", thirdName: "John", fourthName: "Sam", fithName: "Freddy"), "score" : (5, 4, 3, 5, 3)]

let nameInDic = dictionary["name"]
let namesList: () = print("Names in dictionary: \(nameInDic.self ?? String())")
