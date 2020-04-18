//
//  UserListVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation

 
struct UserListVM {
    
//    let users: [User]
    var usersVM: [UserVM] // { }
    
    init() {
        self.usersVM = [UserVM]()
    }
    
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
//        self.usersVM.
//        return self.users.count
        return 10
    }
    
    func userAt(_ indexPath: Int) -> UserVM {
        return self.usersVM[indexPath]
//        let user = self.users[indexPath]
//        return UserVM(user)
    }
    
    
}
