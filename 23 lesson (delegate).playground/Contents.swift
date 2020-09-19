import UIKit

//0)Изучить раздел "Протоколы -> Делегирование" в документации.
//1) Проработать код из видео.
//2) Создать 2 протокола:
//1- "Начинай писать код" со свойствами: время, количество кода.
//И функцией writeCode()
//2- "Заканчивай писать код" с функцией: stopCoding()
//
//И класс: Разработчик, у которого есть свойства - количество программистов, специализации(ios, android, web).
//Разработчику подключаем два этих протокола.
//Задача: вывести в консоль сообщения - "разработка началась. пишем код" и "работа закончена. Сдаю в тестирование".

//MARK: - Protocols
//Протокол начала разработки
protocol Working {
    var nickname: String {get set}
    var time: Double {get set}
    var countOfCode: Int {get set}
    var delegate: GoingToTest? {get set}
    func writeCode(text: String)
}

//Протокол окончания разработки
protocol StopCode {
    func stopCoding(time: Double)
}

//Протокол тестирования кода
protocol TestingProtocol {
    var savedText: [String] {get set}
    func saveCoding(text: String)
}

//MARK: - Classes
//Класс для хранения тестируемого кода
class GoingToTest: TestingProtocol {
    var savedText: [String] = []
    func saveCoding(text: String) {
        savedText.append(text)
    }
}

//Класс программиста
class LeshaAleshaaCoding: Working, StopCode {
    var nickname: String
    var time: Double
    var countOfCode: Int
    var delegate: GoingToTest?
    var countOfDevelopers: Int
    enum Language: String {
        case IOS = "IOS"
        case Android = "Android"
        case Web = "Web"
    }
    
    init(nickname: String, time: Double, countOfCode: Int, delegate: GoingToTest?, countOfDevelopers: Int, language: Language) {
        self.nickname = nickname
        self.time = time
        self.countOfCode = countOfCode
        self.delegate = delegate
        self.countOfDevelopers = countOfDevelopers
        print("Разработка началась в \(time), колличество разработчиков: \(countOfDevelopers), ник: \(nickname), планируемое колличество кода: \(countOfCode) символа на языке \(language.rawValue)")
    }
    
    //Метод делегирования в тестирование
    func writeCode(text: String) {
        delegate?.saveCoding(text: text)
    }
    
    //Метод для уведомления и фиксирования времени завершения кода
    func stopCoding(time: Double) {
        print("Разработка закончилась в \(time)")
    }
}

//MARK: - Instances
//Экземпляры тестирования и программиста
let savingText = GoingToTest()
let leshaCoding = LeshaAleshaaCoding(nickname: "LeshaAleshaa", time: 12.31, countOfCode: 123124, delegate: savingText, countOfDevelopers: 1, language: .IOS)

//Работа с экземплярами
leshaCoding.writeCode(text: "var newone = 123123")
leshaCoding.writeCode(text: "let something = 12.32")
savingText.savedText

