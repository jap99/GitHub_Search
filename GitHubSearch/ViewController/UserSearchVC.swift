//
//  UserSearchVC.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import UIKit

class UserSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
//    var usersArray: UserList?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tv: UITableView!
    
    // MARK: - INIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    // MARK: - SETUP
    
    private func setup() {
        NetworkEngine().mainPageSearch(for: "jap99") { (users) in
            if let users = users {
                print(users)
            }
        }
//        NetworkEngine().getUsers { (response) in
//            switch response {
//            case .data(let users):
//                users.forEach({ (user) in
//                    print(user)
//                })
//            default:
//                print("PRINTING DEFAULT ---")
//            }
//        }
    }
    // MARK: - ACTIONS
    
    
    // MARK: - TABLE VIEW
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UserCellID, for: indexPath) as? UserCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let users = usersArray?.items else {
//            return 0
//        }
//        return users.count
        return 10
    }
    
 
    
    
}

 
 
