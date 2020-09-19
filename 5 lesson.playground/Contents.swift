import UIKit


//5 урок
//Создать словари, вывести в консоль, создать пустой словарь, если он пуст, то добавить пару значений
let rusMonths = [0: "Январь", 1: "Февраль", 2: "Март", 3: "Апрель", 4: "Май"]
let engMonths = [0: "Jan", 1: "Feb", 2: "Mar", 3: "Apr", 4: "May"]

for (score,name) in rusMonths{
    print("Score is \(score) and month is \(name)")
}
for (score,name) in engMonths{
    print("Score is \(score) and month is \(name)")
}

var emptydic = [Int:String]()
if emptydic.isEmpty{
    emptydic.updateValue("Not empty", forKey: 0)
    emptydic.updateValue("Nono, full", forKey: 1)
    print(emptydic)
    } else {
    print("Empty")
}
emptydic.updateValue("Not empty", forKey: 0)
emptydic.updateValue("Nono, full", forKey: 1)
print(emptydic)
