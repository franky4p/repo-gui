//
//  News.swift
//  Task1
//
//  Created by Pavel Khlebnikov on 14.07.2021.
//

import Foundation
import Unrealm

struct MyNews: Decodable, Realmable {
    
    static func primaryKey() -> String? {
        return "id"
    }
    
    private enum CodingKeys : String, CodingKey {
        case id = "source_id"
        case typeNews = "type"
        case likes = "likes"
        case textNews = "text"
    }
    
    var id: Int?
    var typeNews: String?
    var likes: Likes?
    var textNews: String?
}

struct Likes: Decodable, Realmable {
    private enum CodingKeys : String, CodingKey {
        case canLike = "can_like"
        case canPublish = "can_publish"
        case countLikes = "count"
        case userLikes = "user_likes"
    }
    
    var countLikes: Int?
    var canLike: Int?
    var canPublish: Int?
    var userLikes: Int?
}
