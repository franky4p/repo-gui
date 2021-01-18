//
//  Utilities.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation
import UIKit

func createGroup() -> [Group] {
    let arrayGroup = [Group("Swift lessons"),
                      Group("Python lessons"),
                      Group("Java lessons")
    ]
    
    return arrayGroup
}

func arrayFirstCaracterName(_ arrayUser: [Friend]) -> [String] {
    var caracterName = Set <String>()
    arrayUser.forEach() {user in
        let fCar = String(user.lastName.prefix(1))
        caracterName.insert(fCar)
    }
    
    return Array(caracterName).sorted()
}

extension UIImageView {

    func setCustomImage(_ imgURLString: String?) {
        guard let imageURLString = imgURLString else {
            self.image = UIImage(named: "icons8-socrates-50")
            return
        }
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: URL(string: imageURLString)!)
            DispatchQueue.main.async {
                self.image = data != nil ? UIImage(data: data!) : UIImage(named: "icons8-socrates-50")
            }
        }
    }
}
