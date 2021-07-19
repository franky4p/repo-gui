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
        case comments = "comments"
        case reposts = "reposts"
        case textNews = "text"
    }
    
    var id: Int?
    var typeNews: String?
    var likes: Likes?
    var comments: Comments?
    var reposts: Reposts?
    var views: ViewsNews?
    var textNews: String?
    var screenName: String?
    var photoAuthor: String?
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

struct Comments: Decodable, Realmable {
    private enum CodingKeys : String, CodingKey {
        case countComments = "count"
        case canPost = "can_post"
    }
    
    var countComments: Int?
    var canPost: Int?
}

struct Reposts: Decodable, Realmable {
    private enum CodingKeys : String, CodingKey {
        case countRepost = "count"
        case userRepost = "user_reposted"
    }
    
    var countRepost: Int?
    var userRepost: Int?
}

struct ViewsNews: Decodable, Realmable {
    private enum CodingKeys : String, CodingKey {
        case countViews = "count"
    }
    
    var countViews: Int?
}
