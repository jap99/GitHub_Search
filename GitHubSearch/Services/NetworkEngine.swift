//
//  NetworkEngine.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation
 
enum Result {
    case data(Data)
    case error(Error)
}



enum Endpoint {
    case getUsers
    case getUserDetails
    case getRepositories
    case getStarCount
    
    var url: String {
        switch self {
        case .getUsers:
            return "https://api.github.com/search/users?q=[searchTerm]"
        case .getUserDetails:
            return "https://api.github.com/search/users?q=user:[searchTerm]"
        case .getRepositories:
            return "https://api.github.com/search/repositories?q=user:[searchTerm] "
        case .getStarCount:
            return "https://api.github.com/users/[searchTerm]/starred"
        }
    }
}



class NetworkEngine {
    
    private let engine: NetworkEngineProtocol
    
 
    // MARK: - INIT
 
    init(engine: NetworkEngineProtocol = URLSession.shared) {
        self.engine = engine
    }
    
 
     // MARK: - ACTIONS
 
    func searchForUsers(for text: String, completionHandler: @escaping ([User]?) -> Void) {
        let url = URL(string: Endpoint.getUsers.url.replacingOccurrences(of: "[searchTerm]", with: text))!
        var usersArray: [User] = []
        self.engine.performRequest(for: url) { (data, response, error) in
            if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                    let users = json["items"] as? [[String: Any]] {
                    for u in users {
                        if let username = u["login"] as? String,
                            let url = u["avatar_url"] as? String {
                            let user = User(username, url)
                            self.getRepoCount(user) { (user) in
                                usersArray.append(user!)
                            }
                        }
                    }
                    completionHandler(usersArray)
                }
            } else if let _ = error {
                completionHandler(nil)                             
            }
        }
    }
 
    
    func getRepoCount(_ user: User, completionHandler: @escaping (User?) -> Void) {
        var user = user
        let url = URL(string: Endpoint.getRepositories.url.replacingOccurrences(of: "[searchTerm]", with: user.username))!
        self.engine.performRequest(for: url) { (data, response, error) in
            if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                if let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
                    let count = jsonData["total_count"] as? String {
                    user.repoCount = count
                    completionHandler(user)
                }
            } else if error != nil  {
                completionHandler(nil)           
            }
        }
    }

 
    func getUserDetails(_ keywordSearchText: String, completionHandler: @escaping (User?) -> Void) {
        let url: URL = URL(string: Endpoint.getUserDetails.url.replacingOccurrences(of: "[searchTerm]", with: keywordSearchText))!
        engine.performRequest(for: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return completionHandler(nil)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    print(json)
                    if let items = json["items"] as? [Any] {
                        print(items)
                    }
                    if let totalCount = json["total_count"] as? Int {
                        print(totalCount)
                    }
                }
            }
        }
    }
    
 
    func getRepositoryCount(_ keywordSearchText: String, completionHandler: @escaping (Int?) -> Void) {

    }
    
 
    func getRepositories(_ keywordSearchText: String, completionHandler: @escaping ([User]?) -> Void) {
        let url: URL = URL(string: Endpoint.getRepositories.url.replacingOccurrences(of: "[searchTerm]", with: keywordSearchText))!
        engine.performRequest(for: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return completionHandler(nil)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                    if let items = json["items"] as? [Any] {
                        print(items)
                    }
                    if let totalCount = json["total_count"] as? Int {
                        print(totalCount)
                    }
                }
            }
        }
    }
    

     
//    func getRepoCount(_ users: [User], completionHandler: @escaping ([User]?) -> Void) {
//        var usersArray = [User]()
//        let s = DispatchSemaphore(value: 0)
//        for user in users {
//            var user = user
//            let url = URL(string: Endpoint.getRepositories.url.replacingOccurrences(of: "[searchTerm]", with: user.username))!
//            self.engine.performRequest(for: url) { (data, response, error) in
//                s.signal()
//                if let data = data,
//                    let response = response as? HTTPURLResponse,
//                    response.statusCode == 200 {
//                    if let jsonData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any],
//                        let count = jsonData["total_count"] as? Int {
//                        user.repoCount = count
//                        usersArray.append(user)
//                    }
//                } else if error != nil  {
//                    completionHandler(nil)                
//                }
//            }
//        }
//        s.wait()
//        completionHandler(usersArray)
//    }
    
 
//    private var userSearchWorkItem: DispatchWorkItem?
//    private let queue = DispatchQueue(label: "Concurrent Queue", attributes: .concurrent)
//    private let concurrentTasks: Int = 10
    
//        let url: URL = URL(string: Endpoint.getStarCount.url.replacingOccurrences(of: "[searchTerm]", with: keywordSearchText))!
//                guard let fileURL = data else { return }
//                do {
//                    let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//                    let savedURL = documentsURL.appendPathComponent(fileURL.lastPathComponent)
//                    try FileManager.default.moveItem(at: fileURL, to: savedURL)
//                } catch {
//                    print("FILE ERROR: \(error)")
//                }
