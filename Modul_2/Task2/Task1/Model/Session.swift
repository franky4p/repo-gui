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
    let session =  URLSession(configuration: URLSessionConfiguration.default)

    static let shared = Session()
    
    private init() {}
    
    func requestToAPI(_ url: URLRequest) {
        let task = self.session.dataTask(with: url) { (data, response, error) in
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                print(json ?? "не удалось получить ответ от сервиса")
            }
        
        task.resume()
    }
}

final class RequestVK {
    static let scheme: String = "https"
    static let versionVK: String = "5.126"
    static let hostAPI: String = "api.vk.com"
    
    static func requestConnectVK() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "client_id"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "friends"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: versionVK),
            URLQueryItem(name: "state", value: "228")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    static func requestListFriens() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = hostAPI
        urlComponents.path = "/method/friends.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: versionVK),
            URLQueryItem(name: "fields", value: "nickname")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    static func requestListGroupsUser() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = hostAPI
        urlComponents.path = "/method/groups.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: versionVK),
            URLQueryItem(name: "extended", value: "1")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    static func requestFotoUser() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = hostAPI
        urlComponents.path = "/method/photos.getAll"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: versionVK),
            URLQueryItem(name: "extended", value: "1")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
    
    static func requestGroupsSearch(_ q: String) -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = hostAPI
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: Session.shared.token),
            URLQueryItem(name: "v", value: versionVK),
            URLQueryItem(name: "q", value: q)
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
}
