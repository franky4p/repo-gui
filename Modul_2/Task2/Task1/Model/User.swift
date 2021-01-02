//
//  User.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation
import Unrealm

struct Root<T: Decodable> : Decodable {
    private enum CodingKeys : String, CodingKey { case response = "response" }
    let response : response<T>
}

struct response<T: Decodable> : Decodable {
    private enum CodingKeys : String, CodingKey {
        case items = "items"
        case count = "count"
    }
    let count: Int
    let items : [T]
}

struct Friend: Decodable, Realmable {
    
    static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys : String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case nickname = "nickname"
        case photo = "photo_100"
    }
    var firstName: String = ""
    var id: Int?
    var lastName: String = ""
    var nickname: String?
    var photo: String?
}

struct MyGroup: Decodable, Realmable {
    
    static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case photo = "photo_100"
        case screenName = "screen_name"
    }
    
    var id: Int?
    var name: String = ""
    var photo: String?
    var screenName: String = ""
}
