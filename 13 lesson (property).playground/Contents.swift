import UIKit

/*
 2. Создать класс "IOS_Students",добавить ему property: date_of_birth, skills. Для тренировки.
 //Создавайте свои структуры с разными видами свойств: сохраняемые/не сохраняемые, вычисляемые, свойства типа и т.д
 */

//Класс студентов
class IOS_Students {
    let birthday: Double
    let skills: (String, String, String)
    init(birthday: Double, skills: (String, String, String)) {
        self.birthday = birthday
        self.skills = skills
    }
}

// Экземпляр классас и вывод в консоль
let iosStudentAlexey = IOS_Students(birthday: 27.06, skills: ("Коммуникабельность", "стрессоустойчивость", "усердие"))
print("День рождения студента Алексея - \(iosStudentAlexey.birthday), а его навыки - \(iosStudentAlexey.skills.0), \(iosStudentAlexey.skills.1) и \(iosStudentAlexey.skills.2)")

//Структура с игрушками без вычислений
struct MyFavoriteToys {
    let firstToy: String
    let secondToy: String
    let firstToyBirthday: Double
    let secondToyBirthday: Double
    var myFavoriteToy: String {
        willSet {
            print("Внимание, пользователь хочет изменить любимую игрушку на " + newValue)
            myFavoriteToy == newValue
        }
        didSet {
            print("Было выведено в консоль уведомление об изменении любимой игрушки и она была изменена")
        }
    }
}

//Экземпляр структуры и присвоение новых значений
var alexeyToys = MyFavoriteToys(firstToy: "Лошадка", secondToy: "Машинка", firstToyBirthday: 24.05, secondToyBirthday: 30.03, myFavoriteToy: "Пистолет")
print("Любимые игрушки Леши это - \(alexeyToys.firstToy) и \(alexeyToys.secondToy)")
alexeyToys.myFavoriteToy = "Телефон"
alexeyToys.myFavoriteToy

//Структура студента с вычислямым значением (обьединение нескольких параметров)
struct StudentInfo {
    let firstName: String
    let lastName: String
    let sex: String
    var fullInfo: String {
        get {
            return "Имя студента - " + firstName + " " + lastName + " и он: " + sex
            
        }
        set {
            print("Некорректно введенные данные")
        }
    }
}

//Экземлпяр структуры и вывод в консоль
var studentAlexey = StudentInfo(firstName: "Алексей", lastName: "Смицкий", sex: "мужчина")
print(studentAlexey.fullInfo)
studentAlexey.fullInfo = "Я Леха"

/*
 3. Написать структуру "Create_Triangle",с двумя свойствами - угол A,угол C.
 И создать 2 вычисляемых свойства - те же угол А,угол С.
 И если мы записываем значения в эти углы - результатом должно быть значение третьего угла.
 Для простоты можно взять прямоугольный треугольник, сумма углов которого равна 180 градусов.
 */

//Структура треугольника и вычисление третьего угла
struct Create_Triangle {
    let firstCorner: Int
    let secondCorner: Int
    var thirdCorner: String {
        get {
            return "Первый угол равен \(firstCorner), второй угол равен \(secondCorner), а третий угол равен 180 градусам минус сумма двух углов, то бишь: " + String(180 - (firstCorner + secondCorner)) + " градусов"
        }
        set {
            if newValue != "" {
                print("Третий угол попытались ввести вручную, он все равно останется равен предыдущему выражению")
            }
        }
    }
}

//Экземпляр структуры, вычисление значения и попытка изменить значение вручную
var searchCorner = Create_Triangle(firstCorner: 40, secondCorner: 50)
print(searchCorner.thirdCorner)
searchCorner.thirdCorner = "23124124"


/*
 4. Создать структуру "Резюме", у которой есть такие свойства:
 - Фамилия,
 - Имя.
 - Должность,
 - Опыт,
 - Контактные данные(телефон, емейл),
 - О себе(можно записать какие-то пару предложений на выбор).
 */

//Структура со свойствами
struct InformationAboutMe {
    let lastName: String
    let firstName: String
    let job: String
    var experience: Double {
        willSet {
            experience
        }
        didSet {
            if experience <= 1.0 {
                print("Не вижу смысла писать о человеке, который работает меньше года")
            }
        }
    }
    let contacts: (phoneNumber: String, email: String)
    let shortInfo: String
    var allAboutMe: String {
        get {
            return  "Меня зовут \(firstName), моя фамилия \(lastName), я работаю \(job) уже \(experience) лет, я \(shortInfo), по необходимости мои контактные данные: телефон: \(contacts.phoneNumber) и почта \(contacts.email)"
        }
        set {
            if newValue != "" {
                print("Произведена попытка ввести данные не по формуле")
            }
        }
    }
}

//Экземпляр структуры и выводы в консоль исходя из свойств
var alexeyInfo = InformationAboutMe(lastName: "Смицкий", firstName: "Алексей", job: "программистом", experience: 5.1, contacts: ("8-903-269-52-06", "alexeysmith3@gmail.com"), shortInfo: "коммуникабельный и целеустремленный человек")
print(alexeyInfo.allAboutMe)
alexeyInfo.allAboutMe = "Я Леха из Москвы"
alexeyInfo.experience = 0.5
alexeyInfo.experience = 1.5
print(alexeyInfo.allAboutMe)

/*
 5. Задание на закрепление предыдущих тем:
 Создать журнал, что б можно было писать имя, фамилию и оценку
 Поставить ограничения: имя и фамилия не выше 15 символов каждое.
 И оценка не выше 5.
 Если везде значения превышаться выдавать об этом Сообщения в консоль.
 */
var studentsJournal = [Int:(String, String, Int)]()
func scoringStudents(studentName: String, studentSurname: String, studentScore: Int) {
    if studentName.count >= 16 || studentSurname.count >= 16 || studentScore >= 6 {
        print("Введите имя, которое не превышает 15 символов и такую же фамилию, и оценку не выше 5ти")
    } else {
        studentsJournal.updateValue((studentName, studentSurname, studentScore), forKey: studentsJournal.keys.count)
    }
}
scoringStudents(studentName: "Алексей", studentSurname: "Смицкий", studentScore: 3)
scoringStudents(studentName: "Дмитрий", studentSurname: "Иванов", studentScore: 4)
scoringStudents(studentName: "Анастасия", studentSurname: "Соколова", studentScore: 2)
scoringStudents(studentName: "Кирилл", studentSurname: "Мальцев", studentScore: 5)
scoringStudents(studentName: "Жультерментангариме", studentSurname: "Магомедов", studentScore: 4)
print(studentsJournal)

/*
6. Написать класс,в котором есть 4 функции:
-пустая, которая просто выводит сообщение через print,
- которая принимаете параметры и выводит их в консоль,
- которая принимает и возвращает параметры.
- которая принимает замыкание и распечатывает результаты в консоль
*/

//Пустая с выводом в консоль
func emptyPrint() {
    print("Пустая функция")
}
emptyPrint()

//Принимает параметры и выводит в консоль
func giveMeParameters(name: String, surname: String, age: Int) {
    print("Меня зовут \(name), фамилия \(surname) и мне \(age)")
}
giveMeParameters(name: "Алексей", surname: "Смицкий", age: 22)

//Принимает и возвращает параметры
func onlineOrNot(online: Bool) -> Bool {
    if online != true {
        print("Оффлайн")
    } else {
        print("Онлайн")
    }
    return online
}
onlineOrNot(online: true)

//Принимает замыкание и выводит в консоль
var scoringArray = [300, 500, 200, 600, 10, 5000, 4341, 4512351, 235]

func arraySorting(array: [Int], closureFunc: ([Int]) -> [Int]) -> [Int] {
    return closureFunc(array)
}
func closureSort(array: [Int]) -> [Int] {
    return array.sorted(by: {$0 < $1})
}
print(arraySorting(array: scoringArray, closureFunc: closureSort(array:)))
