import UIKit

//2) Создать класс родитель и 2 класса наследника.
//Класс родитель
class ParentsName {
    var father = ""
    var mother = ""
    var fatherAge = 0
    var motherAge = 0
    init(father: String, mother: String, fatherAge: Int, motherAge: Int) {
        self.father = father
        self.mother = mother
        self.fatherAge = fatherAge
        self.motherAge = motherAge
    }
    func parentsName(fatherName: String, motherName: String) {
        print("Имя отца \(fatherName) а матери \(motherName)")
    }
}

//Сабкласс с возрастом
class SubclassAge: ParentsName {
    func ages(fatherAge: Int, motherAge: Int) {
        print("\(father): \(fatherAge) года, \(mother): \(motherAge) ")
    }
}

//Сабкласс с полом
class SubclassSex: SubclassAge {
    var fatherSex = ""
    var motherSex = ""
    func sex(fatherSex: String, motherSex: String) {
        print("\(father): \(fatherAge) года, он \(fatherSex), а \(mother): ей \(motherAge) и она \(motherSex)")
    }
}

//Экземпляр класса
var parentsUsers = SubclassSex(father: "Алексей", mother: "Анастасия", fatherAge: 22, motherAge: 30)
parentsUsers.sex(fatherSex: "мужчина", motherSex: "женщина")

//3) Написать программу, в которой создать класс *House* в нем несколько свойств - *width*, *height* и несколько методов - *create*(выводит произведение свойств),*destroy*(отображает что дом уничтожен)и т.п.
//Класс дома
class House {
    var width = 0
    var height = 0
    var area = 0
    var nameOfStreet = ""
    init(width: Int, height: Int, nameOfStreet: String) {
        self.width = width
        self.height = height
        self.nameOfStreet = nameOfStreet
        self.area = width * height
    }
    
    //Метод для вызова информации о доме
    func housePrint() {
        print("Дом находится на улице \(nameOfStreet) и его площадь равна: \(area)")
    }
    //Метод для создания дома
    func createHouse() {
        print("Создан дом на улице \(nameOfStreet), его площадь равна: \(area)")
    }
    //Метод для уничтожения дома
    func destroyHouse() {
        print("Дом на улице \(nameOfStreet) с площадью \(area) был уничтожен")
    }
    //Метод для переезда дома на новую улицу
    func toNewStreet(newStreet: String) {
        print("Дом с улицы \(nameOfStreet) переехал на улицу \(newStreet)")
        nameOfStreet = newStreet
    }
}
//Создание нового дома
var newHouse = House.init(width: 4124, height: 414, nameOfStreet:"Новохорошевский проезд")
//Свойство создания
newHouse.createHouse()
//Свойство уничтожения
newHouse.destroyHouse()
//Свойство вывода в консоль текущего дома
newHouse.housePrint()
//Свойство переезда на новую улицу
newHouse.toNewStreet(newStreet: "Песчаная площадь")
//Свойство вывода в консоль текущего дома
newHouse.housePrint()


//4) Создайте класс с методами, которые сортируют массив учеников.
//Класс со студентами
class Students {
    var studentsArray = [String]()
    //Добавление нового значения
    func appendStudent(name: String) {
        studentsArray.append(name)
    }
    //Удаление значения
    func deleteStudent(value: Int) {
        studentsArray.remove(at: value)
    }
    //Вывод в консоль
    func printStudents() {
        print(studentsArray)
    }
    //Сортировка по колличеству букв
    func indexSort() -> [String] {
        return studentsArray.sorted(by: {$0.count < $1.count})
    }
    //Сортировка в обратном порядке
    func reverseStudents() -> [String] {
        return studentsArray.reversed()
    }
}

//Присвоение класса и работа с ним
let appendNew = Students()
appendNew.appendStudent(name: "Alexey")
appendNew.appendStudent(name: "Dima")
appendNew.appendStudent(name: "Anastasia")
appendNew.printStudents()
print(appendNew.indexSort())
appendNew.appendStudent(name: "Sergey")
appendNew.printStudents()
let sortedFriends = appendNew.indexSort()
print(sortedFriends)
let reversedFriends = appendNew.reverseStudents()
print(reversedFriends)

//5) Написать свою структуру и пояснить в комментариях - чем отличаются структуры от классов.
struct UserParameters {
    var name: String
    var age: Int
    var sex: String
}

var userNastya = UserParameters(name: "Анастасия", age: 30, sex: "Female")
userNastya.age = 31
print("Пользователь \(userNastya.name), ей \(userNastya.age)")
//Эппл рекомендует использовать структуру вместо класса, когда дело касается небольшого колличества кода, а также в структуре уже заложены инициализаторы значений по умолчанию, что упрощает работу с ними и увеличивает скорость.


//Дополнительно(на закрепление всех пройденных тем): Напишите простую программу, которая называет комбинации в покере. 1) Записываем комбинации в массив. 2) Если определённая комбинация - выводим соответствующую запись в print.
//Энам мастей
enum Cards: String {
    case bubne = "Бубны"
    case kresti = "Крести"
    case chervi = "Черви"
    case piki = "Пики"
}

//Энам карт
enum CardsGame: String {
    case king = "Король"
    case dama = "Дама"
    case valet = "Валет"
    case tuz = "Туз"
    case six = "Шесть"
    case seven = "Семь"
    case eight = "Восемь"
    case nine = "Девять"
    case ten = "Десять"
}

//Массив комбинаций
let comboArray = ["Старшая карта", "Две пары", "Флеш"]

//Класс игры в покер
class PokerGame {
    
    // Функция для ввода комбинации игрока и вывода кейса(полностью заполнять очень долго, на примере одной из комбинаций)
    func player (firstCard: (CardsGame, Cards), secondCard: (CardsGame, Cards), thirdCard: (CardsGame, Cards), fourthCard: (CardsGame, Cards), fithCard: (CardsGame, Cards)) {
        switch (firstCard, secondCard, thirdCard, fourthCard, fithCard) {
        case ((CardsGame.king, Cards.piki),(CardsGame.dama, Cards.piki),(CardsGame.seven, Cards.piki),(CardsGame.valet, Cards.piki),(CardsGame.tuz, Cards.piki)):
            print("У вас \(comboArray[2]) \(Cards.piki.rawValue)")
        default:
            break
        }
    }
}
//Присвоение класса и ввод параметров игры
var hero = PokerGame()
hero.player(firstCard: (CardsGame.king, Cards.piki), secondCard: (CardsGame.dama, Cards.piki), thirdCard: (CardsGame.seven, Cards.piki), fourthCard: (CardsGame.valet, Cards.piki), fithCard: (CardsGame.tuz, Cards.piki))
