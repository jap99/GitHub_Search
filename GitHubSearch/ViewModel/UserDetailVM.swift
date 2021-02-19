//
//  UserDetailsVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation

class UserDetailVM: NSObject, ViewModel {
     
    weak var view: UserDetailsDelegate?
    var model: User?
    
    init(view: UserDetailsDelegate?, model: User?) {
        self.view = view
        self.model = model
        super.init()
    }
    
    
    // MARK: - VIEW_MODEL
    
    func viewDidAppear(_ animated: Bool) {
        if let view = self.view, let model = self.model {
            view.setBackgroundColor()
            view.setNavigationTitle("TEST TITLE")
        }
    }
    
    func setView(delegate: AnyObject?) -> Void {        // Called in prepareForSegue:
        self.view = delegate as? UserDetailDelegate
    }
}
