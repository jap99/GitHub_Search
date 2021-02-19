//
//  ViewModel.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


protocol ViewModel {
    
    func viewDidAppear(_ animated: Bool)
    func setView(delegate: AnyObject?) -> Void
    
}
