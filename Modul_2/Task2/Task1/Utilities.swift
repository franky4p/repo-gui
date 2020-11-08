//
//  Utilities.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation


func createUser() -> [User] {
    let arrayUser = [User(firstName: "Vasya", lastName: "Pypkin", age: 45),
                     User(firstName: "Katerina", lastName: "Ivanko", age: 35),
                     User(firstName: "Petya", lastName: "Morozov", age: 12)
    ]
    
    return arrayUser
    
}


func createGroup() -> [Group] {
    let arrayGroup = [Group("Swift lessons"),
                      Group("Python lessons"),
                      Group("Java lessons")
    ]
    
    return arrayGroup
}
