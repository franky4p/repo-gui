//
//  User.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import Foundation
import UIKit

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

struct Friend: Decodable {
    private enum CodingKeys : String, CodingKey {
        case firstName = "first_name"
        case id = "id"
        case lastName = "last_name"
        case nickname = "nickname"
        case photo = "photo_100"
    }
    let firstName: String
    let id: Int
    let lastName: String
    var nickname: String?
    let photo: String
    var avatar: UIImage?
}

struct MyGroup: Decodable {
    private enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case photo = "photo_100"
        case screenName = "screen_name"
    }
    
    let id: Int
    let name: String
    let photo: String
    let screenName: String
    var avatar: UIImage?
}
