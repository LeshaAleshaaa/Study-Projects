import UIKit

//3. Создать клас в котором будет 3 проперти мама Папа и дети . Создать sabscript и упорядочить их по индексу.
class Parents {
    let mother = "Mother"
    let father = "Father"
    let children = "Sister"
    
    subscript(index: Int) -> String {
        switch index {
        case 0: return mother
        case 1: return father
        case 2: return children
        default:
            return ""
        }
    }
}
let parentsType = Parents()
parentsType[0]
parentsType[1]
parentsType[2]


//4. Создать Индекс который будет принимать число умножать его на 100 и делить на 2.
struct ScoresIndex {
    let scoreToCount: Int
    
    subscript(index: Int) -> Int {
        switch index {
        case 0: print("\(scoreToCount) умножить на 100 = \(scoreToCount * 100)")
        case 1: print("\(scoreToCount) разделить на 2 = \(scoreToCount / 2)")
        case 2: print("\(scoreToCount) умножить на 100 и разделить на 2 = \(scoreToCount * 100 / 2)")
        default: return 0
        }
        return index
    }
}

let scoreCounting = ScoresIndex(scoreToCount: 1488)
scoreCounting[0]
scoreCounting[1]
scoreCounting[2]


//5.Создать свой subscript у которого внутри есть оператор if else.
struct SomebodyOnline {
    let humanName: String
    subscript(onlineStatus: Bool) -> String {
        if onlineStatus == true {
            print("\(humanName) - сейчас онлайн")
        }
        else {
            print("\(humanName) - сейчас оффлайн")
        }
        return humanName
    }
}

let humanIsOnline = SomebodyOnline(humanName: "Алексей Смицкий")
humanIsOnline[false]


//6. Создать класс человек и в нем 3 проперти имя , возраст пол .
class Human {
    let humanName: String
    let humanAge: Int
    let humanSex: String
    init(humanName: String, humanAge: Int, humanSex: String) {
        self.humanName = humanName
        self.humanAge = humanAge
        self.humanSex = humanSex
    }
    func humanNamePrint() {
        print("Имя человека - \(humanName)")
    }
    func humanAgePrint() {
        print("Возраст человека - \(humanAge)")
    }
    func humanSexPrint() {
        print("Пол человека - \(humanSex)")
    }
}


//7. Создать ещё 2 класса которые наследуються от класса человек и переопределить методы и свойства.
class HumanAlexey: Human {
    let alexeySurname = "Смицкий"
    func alexeyInfo() {
        print("Имя и фамилия этого человека - \(humanName) \(alexeySurname), его возраст - \(humanAge) и он \(humanSex)")
    }
}

class HumanNastya: Human {
    let nastyaSurname = "Соколова"
    func nastyaInfo() {
        print("Имя и фамилия этого человека - \(humanName) \(nastyaSurname), ее возраст - \(humanAge) и она \(humanSex)")
    }
}

let alexeyClass = HumanAlexey(humanName: "Алексей", humanAge: 22, humanSex: "мужчина")
let nastyaClass = HumanNastya(humanName: "Анастасия", humanAge: 30, humanSex: "женщина")
alexeyClass.alexeyInfo()
nastyaClass.nastyaInfo()


//8. Создать дикшинари который хранит все типы данных которые есть а ключ должен быть только строка ( воспользоваться enum для типов данных)
enum Types {
    case string(String)
    case integer(Int)
    case double(Double)
    case float(Float)
    case charecter(Character)
    case bool(Bool)
}

let dictionaryTypes: [String : Types] =
    [ "String" : Types.string("String type"),
      "Integer" : Types.integer(22),
      "Double" : Types.double(22.5),
      "Float" : Types.float(24.5),
      "Character" : Types.charecter("X"),
      "Bool" : Types.bool(true) ]

for types in dictionaryTypes.values {
    print("Имя типа - \(types)")
}
