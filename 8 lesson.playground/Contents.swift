import UIKit

  
//Цикл в цикле
for score in 0...200{
    for i in 0...15{
        if (i > 15){
            continue
        }
        if i == 15 {
            break
        }
    print(i)
    }
}

//Проверка по возрасту через иф елс
var age = 60

if age <= 5 {
    print("Вам нужно в садик")
} else if age <= 18 {
    print("Вам нужно в школу")
} else if age <= 19 {
    print("Вам пора в универ")
} else if age <= 25 {
    print("Вам пора на работу")
} else if age <= 100 {
    print("Можно на пенсию")
}

//Проверка через свитч
switch age {
    case 0...5:
    print("Вам нужно в садик")
    case 6...18:
    print("Вам нужно в школу")
    case 19...54:
    print("Вам пора на работу")
    case 55...100:
    print("Можно на пенсию")
default:
    print("Введите возраст")
}

// Проверка оценок
var name = "Алексей"
var score = 10

switch score {
    case 0...7:
    print("\(name), ты не сдал, колличество баллов: \(score)")
    case 8...10:
    print("\(name), хорошо, колличество баллов: \(score)")
    case 11...12:
    print("\(name), отлично, колличетсво баллов: \(score)")
default:
    print("Твои баллы еще не сформированы")
}

if score <= 7 {
    print("\(name), ты не сдал, колличество баллов: \(score)")
} else if score >= 8 || score == 9 || score == 10 {
    print("\(name), хорошо, колличество баллов: \(score)")
} else if score == 11 || score == 12 {
    print("\(name), отлично, колличетсво баллов: \(score)")
}

//Массив семьи, отсортированный

let familyArray = ["Alexey", "Nastya", "Mihail", "Roman", "Pavel", "Maksim", "Dima", "Olga", "Slava", "Tanya"]
print(familyArray.sorted())
