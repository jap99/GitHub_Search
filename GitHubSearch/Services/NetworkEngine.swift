//
//  WebService.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation

protocol NetworkEngine: class {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    func performRequest(for url: URL, completionHandler: @escaping Handler)
}

extension URLSession: NetworkEngine {       // lets us focus on the NetworkEngine API instead of creating multiple mocks in our tests
    
    func performRequest(for url: URL, completionHandler: @escaping NetworkEngine.Handler) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
    
}

class WebService {
    
    enum Result {
        case data(Data)
        case error(Error)
    }
    
    private let engine: NetworkEngine                       // injecting for testability
    
    init(engine: NetworkEngine = URLSession.shared) {       // using URLSession.shared as default to maintain backward compatibility
        self.engine = engine
    }
    
//    func getUsers(completionHandler: @escaping (Result) -> Void) {
//        let url: URL = URL(string: "https://api.github.com/search/users?q=tom+repos:%3E42+followers:%3E1000")!
//        engine.performRequest(for: url) { (data, response, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                return completionHandler(.error(error))
//            } else  if let data = data,
//                let response = response as? HTTPURLResponse,
//                response.statusCode == 200 {
//                do {
//                    if let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
//                        print(json)
//                        print(response)
//                        return completionHandler(.data(data))
//                    }
//                } catch {
//
//                }
//            }
//
//        }
//    }
    
    func getUsers(completionHandler: @escaping ([User]?) -> Void) {
        let url: URL = URL(string: "https://api.github.com/search/users?q=tom+repos:%3E42+followers:%3E1000")!
        engine.performRequest(for: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return completionHandler(nil)
            } else if let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 {
                do {
                    let usersList = try! JSONDecoder().decode(UserList.self, from: data)
                    print(usersList)
                    return completionHandler(usersList.items)
//                    if let usersList = usersList {
//                        print(usersList)
//                        return completionHandler(usersList.users)
//                    }
                    
                } 
            }
        }
    }
    
    
}


//                guard let fileURL = data else { return }
//                do {
//                    let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//                    let savedURL = documentsURL.appendPathComponent(fileURL.lastPathComponent)
//                    try FileManager.default.moveItem(at: fileURL, to: savedURL)
//                } catch {
//                    print("FILE ERROR: \(error)")
//                }
