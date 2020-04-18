//
//  URLSession+Ext.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation

extension URLSession: NetworkEngineProtocol {       // lets us focus on the NetworkEngine API instead of creating multiple mocks in our tests
    
    func performRequest(for url: URL, completionHandler: @escaping NetworkEngineProtocol.Handler) {
        let task = dataTask(with: url, completionHandler: completionHandler)
        task.resume()
    }
    
}
