//
//  NetworkEngineProtocol.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


protocol NetworkEngineProtocol: class {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    func performRequest(for url: URL, completionHandler: @escaping Handler)
}


