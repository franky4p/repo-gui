import UIKit
import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n"){
    var outArray = [String] ()
    
    for item in items {
        outArray.append("\(item)")
    }
    
    let output = items.map {"\($0)"}.joined(separator: separator)
    Swift.print(output)
}


enum TypeCar: String {
    case passanger = "Легковой автомобиль"
    case autotruck = "Грузовой автомобиль"
}

enum EngineMode: String {
    case start = "Двигатель запущен"
    case turnOff = "Двигатель заглушен"
}

enum Position {
    case open, close
}

enum Target {
   case window, door, trunk
}

struct Car {
    let type: TypeCar
    let brand: String
    let yearManufacture: Int
    let trunkVolume: Double
    private var windowPosition: Position
    private var doorState: Position
    private var truncState: Position
    var engineMode: EngineMode
    
    init(type: TypeCar, brand: String, yearManufacture: Int, trunkVolume: Double) {
        self.type = type
        self.brand = brand
        self.yearManufacture = yearManufacture
        self.trunkVolume = trunkVolume
        
        windowPosition = .close
        doorState = .close
        truncState = .close
        engineMode = .turnOff
    }
    
    mutating func Close(target: Target) {
        switch target {
        case .window:
            self.windowPosition = .close
        case .door:
            self.doorState = .close
        case .trunk:
            self.truncState = .close
        }
    }
    
    mutating func Open(target: Target) {
        switch target {
        case .window:
            self.windowPosition = .open
        case .door:
            self.doorState = .open
        case .trunk:
            self.truncState = .open
        }
    }
    
}

var oneCar = Car(type: .passanger, brand: "Honda", yearManufacture: 2000, trunkVolume: 1.5)

oneCar.Open(target: .door)

print(oneCar)
