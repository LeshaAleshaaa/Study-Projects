import UIKit
//
//2) Используя протоколы, написать программу "Железный человек"(ЖЧ).
//Задача: программа ЖЧ выполняет простые действия. Такие как: летать, стрелять, ходить, бегать, заряжаться, автопилот(придумайте что ЖЧ будет делать) и выводит их в консоль.
//Алгоритм:
//1) Создаём протоколы действий,
//2) Задаём протоколам свойства и методы.
//3) Создаём класс Mark42(например).
//4) Активируем протоколы для Mark42.
//5) Инициализируем свойства и методы протоколов в классе.
//6) Выводим результаты в консоль.
//
//Например: "Протокол "Стрельба" активирован", "Mark42, протокол "Полет" активирован".
//Тут оставляем непаханное поле для вашей фантазии и знания комиксов Marvel:)
//
//3) Для закрепления по-создавайте собственные протоколы в связке с классами, структурами.Результаты, как всегда, в консоль.


//Протокол активации
protocol Activation {
    var color: String { get }
    func activation()
}

//Протокол стрельбы
protocol Shooter {
    func activateShoot()
    var autoShooting: String { get set }
}

//Протокол полета
protocol Flying {
    func activateFly(speed: Int)
    subscript(index: Int) -> String { get }
}

//Класс костюма
class Mark42: Activation, Shooter, Flying {
    
    //Свойства
    var color: String
    var autoShooting: String {
        get {
            "Auto"
        } set {
            if newValue == "Mono" {
                print("Стрельба переключена на " + newValue)
                newValue
            } else {
                print("Введите - Mono")
            }
        }
    }
    
    init(color: String) {
        self.color = color
    }
    
    //Сабскрипт для вариаций полета
    subscript(index: Int) -> String {
        
        switch index {
        case 0:
            print("Полет вверх активирован")
            print("0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
            return "Вверх"
        case 1:
            print("Полет вниз активирован")
            print("0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
            return "Вниз"
        case 2:
            print("Полет налево активирован")
            print("0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
            return "Налево"
        case 3:
            print("Полет направо активирован")
            print("0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
            return "Направо"
        default:
            print("Введите от нуля до трех")
            print("0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
            return ""
        }
    }
    
    //Методы для активации, стельбы и полета из протоколов
    func activation() {
        print("Потокол марк 42 активирован, цвет -  \(color)")
    }
    
    func activateShoot() {
        print("Протокол стрельбы активирован, стрельба автоматическая, для смены напишите Mono в свойство autoShooting")
    }
    
    func activateFly(speed: Int) {
        print("Протокол полета активироан, скорость - \(speed) для направления полета напишите число от нуля до трех сабскриптом в в виде: 0 - Вверх, 1 - Вниз, 2 - Налево, 3 - Направо")
    }
}

//Экземпляр костюма и работа с ним
let mark42 = Mark42(color: "Красный")
mark42.activation()
mark42.activateShoot()
mark42.activateFly(speed: 1231)
mark42[0]
mark42[1]
mark42.autoShooting = "Mono"


//Практика с другими протоколами
protocol Student {
    var name: String { get }
    var surname: String { get }
    var fullname: String { get }
}

protocol JuniorDev {
    var mainSkill: String { get }
    func sayHello()
}

//Класс с протоколами
class Alexey: Student, JuniorDev {
    
    var name = "Алексей"
    var surname = "Смицкий"
    var mainSkill = "Трудолюбие"
    var fullname: String {
        get {
            name + " " + surname
        }
    }
    
    func sayHello() {
        print("Привет, меня зовут \(fullname), я учусь на разработчика и мой главный скилл это \(mainSkill)")
    }
}

//Структура с проктоколами
struct SomeStudent: Student, JuniorDev {
    
    var name: String
    var surname: String
    var mainSkill: String
    var fullname: String {
        get {
            name + " " + surname
        }
    }
    func sayHello() {
        print("Привет, меня зовут \(fullname), я учусь на разработчика и мой главный скилл это \(mainSkill)")
    }
}

//Экземпляры класса и структуры
let studentAlexey = Alexey()
print()
studentAlexey.sayHello()

let studentNastya = SomeStudent(name: "Анастасия", surname: "Соколова", mainSkill: "Целеустремленность")
print()
studentNastya.sayHello()
