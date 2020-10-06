import UIKit
import Foundation


enum EngineMode: String {
    case start = "Двигатель запущен"
    case turnOff = "Двигатель заглушен"
}

enum Position: String {
    case open = "Открыто"
    case close = "Закрыто"
}

enum Target {
   case window, door, trunk
}

extension Target: CaseIterable {}

protocol CarProtokol {
    var brand: String { get }
    var yearManufacture: Int { get }
    var windowPosition: Position { get set }
    var doorState: Position { get set }
    var truncState: Position { get set }
    var engineMode: EngineMode { get set }
    
    mutating func engineControl(mode: EngineMode)
}

extension CarProtokol {
    
    mutating func engineControl(mode: EngineMode) {
        self.engineMode = mode
    }
    
    mutating func SwitchPosition(target: Target, mode: Position) {
        switch target {
        case .window:
            self.windowPosition = mode
        case .door:
            self.doorState = mode
        case .trunk:
            self.truncState = mode
        }
    }
}

class SportCar: CarProtokol {
    var windowPosition: Position = .close
    var doorState: Position = .close
    var truncState: Position = .close
    var engineMode: EngineMode = .turnOff
    let brand: String
    let yearManufacture: Int
    
    let maxSpeed: Float
    
    init(brand: String, yearManufacture: Int, maxSpeed: Float) {
        self.brand = brand
        self.yearManufacture = yearManufacture
        self.maxSpeed = maxSpeed
    }
}

class TrunkCar: CarProtokol {
    //не забыть задать вопрос как можно реализовывать private свойства в протоколе
    internal var windowPosition: Position = .close
    internal var doorState: Position = .close
    internal var truncState: Position = .close
    internal var engineMode: EngineMode = .turnOff
    let brand: String
    let yearManufacture: Int
    
    let carring: Double
    
    init(brand: String, yearManufacture: Int, carring: Double) {
        self.brand = brand
        self.yearManufacture = yearManufacture
        self.carring = carring
    }
}


extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        ----------------
        Марка - \(brand)
        Год выпуска - \(yearManufacture)
        Позиция окон - \(windowPosition.rawValue)
        Позиция дверей - \(doorState.rawValue)
        Позиция богажника - \(truncState.rawValue)
        \(engineMode.rawValue)
        Максимальная скорость - \(maxSpeed)
        ----------------
        """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
        ----------------
        Марка - \(brand)
        Год выпуска - \(yearManufacture)
        Позиция окон - \(windowPosition.rawValue)
        Позиция дверей - \(doorState.rawValue)
        Позиция богажника - \(truncState.rawValue)
        \(engineMode.rawValue)
        Грузоподъемность - \(carring)
        ----------------
        """
    }
}

var MySportCar = SportCar(brand: "BMW", yearManufacture: 2015, maxSpeed: 300)
var MyTruncCar = TrunkCar(brand: "Volvo", yearManufacture: 2000, carring: 15.5)

for target in Target.allCases {
    MySportCar.SwitchPosition(target: target, mode: .open)
}

MyTruncCar.engineControl(mode: .start)

print(MySportCar)
print(MyTruncCar)
