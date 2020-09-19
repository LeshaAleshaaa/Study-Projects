import UIKit

//1)Постарайтесь по больше по практиковаться,
//повторите то что есть в видео.
//2)Зайти обязательно и познакомиться с документацией.
//3)Я как заказчик даю вам разработчику задания сделать :
//a) Библиотеку книг и видео библиотеку фильмов
//b)Возможность добавлять новые книги и фильмы и после добавления должна происходить автоматическая сортировка по алфавиту
//с)Сделать так что б когда я вызову метод(создайте сами его) - "Sort by mood" то фильмы должны отсортировать по настроению:)
//d)И такойже медод придумать для книг :)


//Классы книг и фильмов
class Books {
    let bookAutor: String
    let bookName: String
    let mood: BookGenge.RawValue
    
    init(bookAutor: String, bookName: String, mood: String) {
        self.bookAutor = bookAutor
        self.bookName = bookName
        self.mood = mood
    }
}

class Films {
    let filmName: String
    let filmDuration: Int
    var mood: FilmsGenge.RawValue
    
    init(filmName: String, filmDuration: Int, mood: String) {
        self.filmName = filmName
        self.filmDuration = filmDuration
        self.mood = mood
    }
}


//Перечисления жанров книг и фильмов
enum BookGenge: String {
    case fantasy = "Фантастика"
    case dramma = "Драмма"
    case comedy = "Комедия"
    case thriller = "Триллер"
}

enum FilmsGenge: String {
    case comedy = "Комедия"
    case fantasy = "Фантастика"
    case dramma = "Драмма"
    case thriller = "Триллер"
}


//Массивы с книгами и фильмами
var booksLibary: [Books] = [
    Books.init(bookAutor: "Федор Достоевский", bookName: "Идиот", mood: BookGenge.dramma.rawValue),
    Books.init(bookAutor: "Александр Пушкин", bookName: "Евгений Онегин", mood: BookGenge.dramma.rawValue),
    Books.init(bookAutor: "Антон Чехов", bookName: "Палата номер 6", mood: BookGenge.dramma.rawValue)
]

var filmsLibary: [Films] = [
    Films.init(filmName: "Звездные войны", filmDuration: 120, mood: FilmsGenge.fantasy.rawValue),
    Films.init(filmName: "Интерстеллар", filmDuration: 160, mood: FilmsGenge.fantasy.rawValue),
    Films.init(filmName: "Судья", filmDuration: 95, mood: FilmsGenge.dramma.rawValue)
]


//Методы для добавления новой книги и фильма
func addNewBook(bookAutor: String, bookName: String, mood: BookGenge) -> [Books] {
    booksLibary.append(Books.init(bookAutor: bookAutor, bookName: bookName, mood: mood.rawValue))
    
    return booksLibary.sorted { (firstAutor: Books, secondAutor: Books) -> Bool in
        firstAutor.bookAutor < secondAutor.bookAutor
    }
}

func addNewFilm(filmName: String, filmDuration: Int, mood: FilmsGenge) -> [Films] {
    filmsLibary.append(Films.init(filmName: filmName, filmDuration: filmDuration, mood: mood.rawValue))
    
    return filmsLibary.sorted { (firstFilm: Films, secondFilm: Films) -> Bool in
        firstFilm.filmName < secondFilm.filmName
    }
}


//Добавление новых книг и фильмов
addNewBook(bookAutor: "Лев Толстой", bookName: "Война и мир", mood: .dramma)
addNewBook(bookAutor: "Оноре де Бальзак", bookName: "Шагреневая кожа", mood: .thriller)

addNewFilm(filmName: "Впритык", filmDuration: 99, mood: .comedy)
addNewFilm(filmName: "Побег из Шоушенка", filmDuration: 130, mood: .thriller)
addNewFilm(filmName: "Американский пироог", filmDuration: 96, mood: .comedy)


//Методы для сортировки книг и фильмов
func sortedBooks(mood: BookGenge) -> [Books] {
    booksLibary.sorted { (first: Books, second: Books) -> Bool in
        return first.mood == mood.rawValue
    }
}

func sortedFilms(mood: FilmsGenge) -> [Films] {
    filmsLibary.sorted { (first: Films, second: Films) -> Bool in
        return first.mood == mood.rawValue
    }
}


//Сортировка по жанрам
sortedBooks(mood: .dramma)
sortedBooks(mood: .thriller)
sortedFilms(mood: .comedy)
sortedFilms(mood: .fantasy)
