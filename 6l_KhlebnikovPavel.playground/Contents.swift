import UIKit
import Foundation

protocol GenderProtokol {
    var gender: String { get }
}

class Man: GenderProtokol {
    let gender: String
    let name: String
    
    init(_ gender: String, name:String) {
        self.gender = gender
        self.name = name
    }
}

extension Man: CustomStringConvertible {
    var description: String {
        return """
        ( Имя - \(name) , Пол - \(gender) )
        """
    }
}

let oneMan = Man("Мужчина", name: "Вася")
let twoMan = Man("Мужчина", name: "Миша")
let oneWoman = Man("Женщина", name: "Света")
let twoWoman = Man("Женщина", name: "Валентина")

struct Queue<T: GenderProtokol> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        guard elements.count > 0 else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func filterGender(_ predicat: (GenderProtokol) -> Bool) -> [T] {
        var temp = [T]()
        
        for el in self.elements {
            if predicat(el) {
                temp.append(el)
            }
        }
        return temp
    }
}

//вопрос:
//насколько корректно использовать механизм subscript для обращения не по уникальному индексу (числу),
//а по неуникальному значению в данном примере по строковому свойству?
//Или для таких случаев лучше реализовывать методы типа фильтра найти всех
extension Queue {
    subscript(nameElement: String) -> GenderProtokol? {
        var rezult: GenderProtokol?
        
        for el in self.elements {
            if el.gender.lowercased() == nameElement.lowercased() {
                rezult = el
                break
            }
        }
        return rezult
    }
}

var queuePiople = Queue<Man>()
queuePiople.push(oneMan)
queuePiople.push(oneWoman)
queuePiople.push(twoMan)
queuePiople.push(twoWoman)

print(queuePiople)

let onlyWoman = queuePiople.filterGender() {$0.gender == "Женщина"}
print(onlyWoman)

let fistInQueue = queuePiople.pop()
let secondInQueue = queuePiople.pop()
print("Первый в очереди \(fistInQueue?.name ?? "отсутствует") , за ним \(secondInQueue?.name ?? "никого нет")")

let someMan = queuePiople["мужчина"] as? Man
print(someMan?.name ?? " в очереди таких нет")
//обращение по несуществующему индексу
let someAnather = queuePiople["ребенок"] as? Man
print(someAnather?.name ?? "в очереди таких нет")

