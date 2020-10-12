import UIKit
import Foundation

//MARK: - Task 1
enum RejectionReason: Error {
    case tooYoung
    case dressCode
    case didnotLikeFase
}

enum EntranceToTheClub {
    case yes
    case no
}

class FaseControl {
    func youPass(man: Man) -> (EntranceToTheClub, RejectionReason?) {
        guard man.age >= 18 else {
            return (EntranceToTheClub.no, RejectionReason.tooYoung)
        }
        
        guard man.dress == "маскарадный костюм" else {
            return (EntranceToTheClub.no, RejectionReason.dressCode)
        }
        
        guard Int.random(in: 1...50) < 25 else {
            return (EntranceToTheClub.no, RejectionReason.didnotLikeFase)
        }
        
        return (EntranceToTheClub.yes, nil)
    }
}

class Man {
    let age: Int
    var dress: String
    
    init(age: Int, dress: String) {
        self.age = age
        self.dress = dress
    }
}

let securityGuard = FaseControl()

let oneMan = Man(age: 15, dress: "как все")
let twoMan = Man(age: 16, dress: "маскарадный костюм")
let threeMan = Man(age: 25, dress:"маскарадный костюм")
let fourMan = Man(age: 25, dress:"рабочая одежда")

let firstIn = securityGuard.youPass(man: oneMan)

//хотя проверка на опционал в блоке иначе бессмыслена, т.к.
//при такой архитектуре, если ты не проходишь, то всегда есть причина. Но по условию задания
//нужно было обработать результат при помощи if let
if firstIn.0 == EntranceToTheClub.yes {
    print("Welcome to the club")
} else if let error = firstIn.1 {
    print("You shall not pass - \(error)")
}

//MARK: - Task 2
enum ConditionBook {
    case good
    case bad
}

enum StatusBook: Error {
    case missing
    case notToAccept
}

class Book {
    let name: String
    let genre: String
    var condition: ConditionBook = .good
    
    init(name: String, genre: String) {
        self.name = name
        self.genre = genre
    }
}

class Librarian {
    let library = ["Война и мир": Book(name: "Война и мир", genre: "Роман"),
                   "Преступление и наказание": Book(name: "Преступление и наказание", genre: "Роман"),
                   "Морозко": Book(name: "Морозко", genre: "Сказка")]
    
    func giveOutBook(name: String) throws -> Book {
        guard let book = library[name] else {
            throw StatusBook.missing
        }
        return book
    }
    
    func acceptBook(book: Book) throws -> Bool {
        guard let takeBook = library[book.name] else {
            throw StatusBook.missing
        }
        
        guard takeBook.condition == .good else {
            throw StatusBook.notToAccept
        }
        return true
    }
}

let severeLibrarian = Librarian()

var bookForReading = try? severeLibrarian.giveOutBook(name: "Морозко")

if bookForReading != nil {
    //слегка потрепим книжку и попробуем вернуть
    bookForReading!.condition = .bad
    
    do {
        let result = try severeLibrarian.acceptBook(book: bookForReading!)
        print("Книга возвращена - \(result)")
    } catch let error{
        print("Библиотекарь сказал \(error)")
    }
} else {
    let myBook = Book(name: "Чапаев и Пустота", genre: "Роман")
    
    do {
        let result = try severeLibrarian.acceptBook(book: myBook)
        print("Книга возвращена - \(result)")
    } catch StatusBook.missing {
        print("Это не наша книга")
    } catch let error{
        print("Библиотекарь сказал \(error)")
    }
}
