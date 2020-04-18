//
//  Dynamic.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


class Dynamic<T>: Decodable where T: Decodable {                   // Type Eraser
    
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    
    // MARK: - INIT
    
    init(_ value: T) {
        self.value = value
    }
    
    
    // MARK: - ACTIONS
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        self.listener?(self.value)
    }
    private enum CodingKeys: CodingKey {
        case value
    }
    

    
    
}
