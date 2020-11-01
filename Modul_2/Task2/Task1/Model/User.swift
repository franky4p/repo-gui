//
//  User.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation
import UIKit

class User {
    var firstName: String
    var lastName: String
    var age: Int
    var userGrops: [Group] = []
    var avatar = UIImage(named: "icons8-socrates-50")
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

extension User: CustomStringConvertible {
    var description: String {
        return """
        \(firstName) \(lastName) \(age) год
        """
    }
}
