import UIKit

//3)Создайте по 1-2 enum разных типов.
//Enum напитков
enum Drinks: CaseIterable {
    case CocaCola
    case Nestea
    case Nescafe
    case Sprite
}

//Печать напитков через цикл for
for drinks in Drinks.allCases {
    print(drinks)
}

// Подробный enum напитков
enum AnotherDrinksEnum {
    case SomethingHot(drink: String)
    case SomethingWithSugar(drink: String, sugarSize: Int)
}


//4)Создайте несколько своих enum, названия какие хотите, используйте switch
//Enum офисных сотрудников
enum OfficePeople {
    case Clerk(name: String, sex: String, age: Int, workTime: Double)
    case Cleaning(name: String, sex: String, age: Int, workTime: Double)
}

//Переменные клерка и уборщины
var clerkHuman = OfficePeople.Clerk(name: "Алексей", sex: "мужчина", age: 22, workTime: 1.5)
var cleaningHuman = OfficePeople.Cleaning(name: "Лиза", sex: "женщина", age: 24, workTime: 0.7)

//Вывод клерка через switch
switch clerkHuman {
case let .Clerk(name, sex, age, workTime):
    print("Клерка зовут \(name), он \(sex), его возраст: \(age) года и работает он \(workTime) года")
default:
    break
}

//Вывод уборщицы через switch
switch cleaningHuman {
case let .Cleaning(name, sex, age, workTime):
    print("Уборщицу зовут \(name), она \(sex), ей \(age) года и она работает \(workTime) года")
default:
    break
}

//Enum смартфонов
enum Smartphones {
    case Iphone(model: String, year: Int, color: String)
    case Samsung(model: String, year: Int, color: String)
    case Lenovo(model: String, year: Int, color: String)
}

//Переменные смартфонов
var iPhone = Smartphones.Iphone(model: "iPhone XsMax", year: 2018, color: "Space Gray")
var samsung = Smartphones.Samsung(model: "Samsung Galaxy 10", year: 2018, color: "Black")
var lenovo = Smartphones.Lenovo(model: "Lenovo Y3", year: 2018, color: "White")

//Вывод в консоль через switch
switch iPhone {
case let .Iphone(model, year, color):
    print("Model is \(model), year is \(year) and color is \(color)")
default:
    break
}

switch samsung {
case let .Samsung(model, year, color):
    print("Model is \(model), year is \(year) and color is \(color)")
default:
    break
}

switch lenovo {
case let .Lenovo(model, year, color):
    print("Model is \(model), year is \(year) and color is \(color)")
default:
    break
}


//5)Создать enum со всеми цветами радуги и создать функцию которая содержит названия разных обьектов и цвет из enum
//Enum цветов
enum RainbowColors {
    case Red
    case Orange
    case Yellow
    case Green
    case Blue
    case DarkBlue
    case Purple
}

//Функция для приема данных
func someObject(object: String, color: RainbowColors) {
    print("Object is \(object) and color is \(color)")
}

//Вывод с помощью функции
someObject(object: "Apple", color: .Green)
someObject(object: "Cup", color: .Orange)
someObject(object: "Notebook", color: .Red)


//6)Функция которая выставляет оценки студентами
//Студенты
enum Students {
    case Alexey
    case Nastya
    case Sergey
}

//Функция для выставления оценок
func scoring(name: Students, score: Int){
    let studentScore = score
    switch studentScore {
    case 1...3:
        print("\(name), ты получил \(score), занимайся усерднее!")
    case 4..<5:
        print("\(name), ты получил \(score), еще чуть-чуть и было бы 5!")
    case 5..<5:
        print("\(name), ты получил \(score), молодец!")
    default:
        print("\(name), введи число от 1 до 5")
    }
}

//Выставление оценки и вывод в консоль
scoring(name: .Alexey, score: 4)
scoring(name: .Nastya, score: 4124)
scoring(name: .Sergey, score: 3)


//7)Программа, которая рассказывает какие автомобили стоят в гараже

//Энам с машинами
enum Cars {
    case Volvo(model: String, year: Int, range: Double)
    case Mercedes(model: String, year: Int, range: Double)
    case Mazda(model: String, year: Int, range: Double)
}

// Функция для вывода авто
func carsPrint(){
    let volvoCar = Cars.Volvo(model: "C30", year: 2007, range: 115.345)
    let mercedesCar = Cars.Mercedes(model: "E320", year: 2010, range: 123.124)
    let mazdaCar = Cars.Mazda(model: "3", year: 2014, range: 341.542)
    let carsArray = [volvoCar, mercedesCar, mazdaCar]
    print("В гараже стоят:")
    for carsList in carsArray {
        print(carsList)
    }
}

//Вывод авто в консоль
carsPrint()
