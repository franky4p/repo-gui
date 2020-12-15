//
//  Session.swift
//  Task1
//
//  Created by macbook on 15.12.2020.
//

import Foundation

final class Session {
    var token: String?
    var userId: Int?
    
    static let shared = Session()
    
    private init() {}
    
}
