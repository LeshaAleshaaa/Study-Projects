import UIKit

//1. Создать класс "люди", в этом классе 4 property - "имя", "рост", "вес", "пол", а также будет иметь метод "say(говорит)".
class People {
    let firstname: String
    let lastname: String
    let weight: Double
    let height: Double
    let gender: String
    init(firstname: String, lastname: String, weight: Double, height: Double, gender: String) {
        self.firstname = firstname
        self.lastname = lastname
        self.weight = weight
        self.height = height
        self.gender = gender
    }
    func sayHi() {
        print("Персонаж:")
    }
}


//2. Создать sub class (наследники) "повар", "менеджер", "борец" и переопределить метод "say(говорит)" в каждом из этих классов.
class Cook: People {
    override func sayHi() {
        justPeople.sayHi()
        print("Привет, я \(firstname) \(lastname), я вешу \(weight), мой рост \(height), я \(gender) и я повар")
    }
}

class Manager: People {
    override func sayHi() {
        justPeople.sayHi()
        print("Привет, я \(firstname) \(lastname), я вешу \(weight), мой рост \(height), я \(gender) и я менеджер")
    }
}

class Fighter: People {
    override func sayHi() {
        justPeople.sayHi()
        print("Привет, я \(firstname) \(lastname), я вешу \(weight), мой рост \(height), я \(gender) и я борец")
    }
}


//3. Создать по одному объекту(экземпляру) каждого класса и объединить их в массив.
//4. В цикле “for in” пройти по всем элементам массива и вывести в консоль все характеристики каждого объекта (имя, рост и тд) и у каждого вызвать метод "say(говорит)".
//5. Создать еще одного наследника от super Class, добавить в него пару новых свойств, добавить в массив и в цикле вывода вывести его свойства как дополнение к свойствам People.
//6. Метод "say(говорит)" реализовать таким образом, чтобы перед тем как выполнить собственный method say, выполнялся сначала метод say класса People.
//Релизован в сабклассах посредством justPeople.sayHi()

let justPeople = People(firstname: "Алексей", lastname: "Смицкий", weight: 74.5, height: 180.5, gender: "мужчина")
let cookPeople = Cook(firstname: "Кирилл", lastname: "Мальцев", weight: 68.5, height: 170.5, gender: "мужчина")
let managerPeople = Manager(firstname: "Анастасия", lastname: "Соколова", weight: 50.5, height: 160.5, gender: "женщина")
let fighterPeople = Fighter(firstname: "Артем", lastname: "Есичев", weight: 84.5, height: 189.5, gender: "мужчина")
var peopleArray = [cookPeople, managerPeople, fighterPeople]


class OneMorePeople: People {
    let age: Int
    let birthday: Double
    init(firstname: String, lastname: String, weight: Double, height: Double, gender: String, age: Int, birthday: Double) {
        self.age = age
        self.birthday = birthday
        super.init(firstname: firstname, lastname: lastname, weight: weight, height: height, gender: gender)
    }
    override func sayHi() {
        justPeople.sayHi()
        print("Привет, я \(firstname) \(lastname), я вешу \(weight), мой рост \(height), я \(gender) и я еще один тип")
    }
}

var newone = OneMorePeople(firstname: "Фрол", lastname: "Гугнин", weight: 86.5, height: 189.5, gender: "мужчина", age: 22, birthday: 10.09)
peopleArray.append(newone)

for peoplesJobs in peopleArray {
    peoplesJobs.sayHi()
    if peoplesJobs === newone {
        print("Фролу - \(newone.age) и его день рождения \(newone.birthday)")
    }
    print(peoplesJobs.firstname)
    print(peoplesJobs.lastname)
    print(peoplesJobs.weight)
    print(peoplesJobs.height)
    print(peoplesJobs.gender)
}


//Разделение строк
print()
//7. Вывести все это в обратном порядке(Google в помощь).
for peoplesJobs in peopleArray.reversed() {
    peoplesJobs.sayHi()
    if peoplesJobs === newone {
        print("Фролу - \(newone.age) и его день рождения \(newone.birthday)")
    }
    print(peoplesJobs.firstname)
    print(peoplesJobs.lastname)
    print(peoplesJobs.weight)
    print(peoplesJobs.height)
    print(peoplesJobs.gender)
}


//8. Создать класс "Марсианин" (не наследник класса people!) со своими собственными property (отличными от people) и методом "say" (отличным от people).
class MarsMan {
    let marsName: String
    let fromWhere: String
    let howLongHere: Int
    init(marsName: String, fromWhere: String, howLongHere: Int) {
        self.marsName = marsName
        self.fromWhere = fromWhere
        self.howLongHere = howLongHere
    }
    func sayCool() {
        print("Я с планеты \(fromWhere) и я тут \(howLongHere) дней")
        
    }
}


//9. Унаследоваться от него и создать пару других классов (Инопланетян) с переопределенным методом "say".
//10. Объединить всех people и Марсианинов) в один массив.
class firstUFO: MarsMan {
    override func sayCool() {
        print("Я один из инопланетян")
    }
}

class secondUFO: MarsMan {
    override func sayCool() {
        print("Я второй из инопланетян")
    }
}
let marsGuy = MarsMan(marsName: "Марсианин", fromWhere: "Марс", howLongHere: 10)
let firstGuy = firstUFO(marsName: "Первый инопланетянин", fromWhere: "Земля", howLongHere: 5)
let secondGuy = secondUFO(marsName: "Второй инопланетянин", fromWhere: "Венера", howLongHere: 3)
let arrayOfAll: [AnyObject] = [cookPeople, managerPeople, fighterPeople, newone, marsGuy, firstGuy, secondGuy]

//Разделение строк
print()
//11. В цикле выводить тип объекта (People или Марсианин) перед тем как выводить его свойства и вызывать метод
for allguys in arrayOfAll {
    if let person = allguys as? People {
        print("Человек:")
        person.sayHi()
    }
    if let person = allguys as? MarsMan {
        print("Инопланетянин")
        person.sayCool()
    }
}


//Разделение строк
print()
//12. Поместить всех people в один массив, а Марсиан в другой массив (количество People и Марсиан должно быть разное)
//13. В одном цикле “for in” выводить People а потом Марсианина, доставая данные поочередно из двух разных массивов, если в одном из массивов объектов больше, то в конце должны выводиться только объекты этого массива (так как других уже нет)
let arrayWithPeople = [cookPeople, managerPeople, fighterPeople, newone]
let arrayWithUFO = [marsGuy, firstGuy, secondGuy]

//Если массив с людьми больше
if arrayWithPeople.count >= arrayWithUFO.count {
    for sorting in 0...peopleArray.count - 1 {
        print(peopleArray[sorting].firstname)
        if sorting < arrayWithUFO.count {
            print(arrayWithUFO[sorting].marsName)
        }
    }
}
    //Если массив с марсианами больше
else {
    for sorting in 0...arrayWithUFO.count - 1 {
        print(arrayWithUFO[sorting].marsName)
        if sorting < arrayWithPeople.count {
            print(arrayWithPeople[sorting].firstname)
        }
    }
}


//14. Соединить Марсиан и People в одном массиве.
//15. Используя нужный метод array отсортировать массив (как результат будет другой массив).
//16. Сортировать так: сначала People, а потом Марсиане, люди отсортированы по имени, а Марсиане по марсианским кличкам.
//17.Требует разобраться с сортировкой.
var superArray: [AnyObject] = [cookPeople, managerPeople, fighterPeople, newone, marsGuy, firstGuy, secondGuy]

superArray.sort { (first: AnyObject, second: AnyObject) -> Bool in
    let firstHuman = first as? People
    let secondHuman = second as? People
    if firstHuman != nil && secondHuman != nil {
        return firstHuman!.firstname.count > secondHuman!.firstname.count
    } else {
        return false
    }
}
superArray.sort { (first: AnyObject, second: AnyObject) -> Bool in
    let firtMarsHuman = first as? MarsMan
    let secondMarsHuman = second as? MarsMan
    if firtMarsHuman != nil && secondMarsHuman != nil {
        return firtMarsHuman!.marsName.count > secondMarsHuman!.marsName.count
    } else {
        return false
    }
}
