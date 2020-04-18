//
//  NetworkEngineMock.swift
//  GitHubSearchTests
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


class NetworkEngineMock: NetworkEngine, NetworkEngineProtocol {

    var requestedURL: URL?
    
    func performRequest(for url: URL, completionHandler: @escaping Handler) {
        requestedURL = url
        let data = "Hello, world".data(using: .utf8)
        completionHandler(data, nil, nil)
    }
    
    
    
}

