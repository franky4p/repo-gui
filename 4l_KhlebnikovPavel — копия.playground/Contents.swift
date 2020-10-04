import UIKit
import Foundation

public protocol Serializable {
    func serialize() -> [String: Any]
}

extension Serializable {
    public func serialize() -> [String: Any] {
        var result = [String: Any]()
        var enumeratingMirror: Mirror? = Mirror(reflecting: self)

        while true {
            guard let mirror = enumeratingMirror else { break }

            for child in mirror.children {
                guard let label = child.label else { continue }
                
                //Здесь была попытка обработки для вывода rawValue перечислений, но к сожалениию
                //не хватает знаний, чтобы это сделать
                switch child.value {
                //case let rawRepresentable as? Any<RawRepresentable where .RawValue == String>:
                //    result[label] = rawRepresentable.getValueAsAny()
                case let optional as Optional<Any>:
                    if case .some(let value) = optional {
                        result[label] = "\(value)"
                    }
                default:
                    result[label] = "\(child.value)"
                }
            }
            enumeratingMirror = mirror.superclassMirror
        }
        return result
    }
}

extension Collection where Iterator.Element: Serializable {
    public func serialize() -> [[String: Any]] {
        return map { $0.serialize() }
    }
}

extension RawRepresentable {
    public func getValueAsAny() -> Any {
        return rawValue
    }
}

//MARK: - Main program

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

class Car: Serializable {
    let brand: String
    let yearManufacture: Int
    private var windowPosition: Position = .close
    private var doorState: Position = .close
    private var truncState: Position = .close
    private var engineMode: EngineMode = .turnOff
    
    init(brand: String, yearManufacture: Int) {
        self.brand = brand
        self.yearManufacture = yearManufacture
    }
    
    func Start() {
        self.engineMode = .start
    }
    
    func Stop() {
        self.engineMode = .turnOff
    }
    
    func Close(target: Target) {
        switch target {
        case .window:
            self.windowPosition = .close
        case .door:
            self.doorState = .close
        case .trunk:
            self.truncState = .close
        }
    }
    
    func Open(target: Target) {
        switch target {
        case .window:
            self.windowPosition = .open
        case .door:
            self.doorState = .open
        case .trunk:
            self.truncState = .open
        }
    }
    
    func beep() -> String {
        return "beep"
    }
}

class SportCar: Car {
    let maxSpeed: Float
    
    init(brand: String, yearManufacture: Int, maxSpeed: Float) {
        self.maxSpeed = maxSpeed
        super.init(brand: brand, yearManufacture: yearManufacture)
    }
    
    override func beep() -> String {
        return "be-beep"
    }
}

class TrunkCar: Car {
    let carring: Double
    
    init(brand: String, yearManufacture: Int, carring: Double) {
        self.carring = carring
        super.init(brand: brand, yearManufacture: yearManufacture)
    }
    
    override func beep() -> String {
        return "beee - beeeeep"
    }
}

var MySportCar = SportCar(brand: "BMW", yearManufacture: 2015, maxSpeed: 300)
MySportCar.Open(target: .window)
MySportCar.Open(target: .door)
MySportCar.Start()

var MyTruncCar = TrunkCar(brand: "Volvo", yearManufacture: 2000, carring: 15.5)
MyTruncCar.Open(target: .trunk)

print(MySportCar.serialize())
print(MyTruncCar.serialize())
print(MySportCar.beep())
print(MyTruncCar.beep())
