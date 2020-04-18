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
    private var userListVM: UserListVM!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tv: UITableView!
    
    // MARK: - INIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    
    // MARK: - SETUP
    
    private func setup() {
        self.tv.delegate = self
        self.tv.dataSource = self
        
        NetworkEngine().searchForUsers(for: "jap") { [weak self] (users) in
            if !users!.isEmpty {
                print(users)
                self?.userListVM.usersVM = users!.map(UserVM.init)
//                self.userListVM = UserListVM(users: users!)
                print(users!)
                DispatchQueue.main.async {
                    self?.tv.reloadData()
                }
            }
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
    // MARK: - ACTIONS
    
    
    // MARK: - TABLE VIEW
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UserCellID, for: indexPath) as? UserCell else {
            fatalError("Table view cell not found")
        }
        let userVM = self.userListVM.userAt(indexPath.row)
        cell.profileImageView.image = userVM.profileImage
        cell.usernameLabel.text = userVM.username
        cell.repoCountLabel.text = userVM.repoCount
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.userListVM.numberOfRowsInSection(section))
        return self.userListVM.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.userListVM == nil ? 0 : self.userListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Constants.goToUserDetailsVC, sender: Any?.self)
    }
 
    
    // MARK: - SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.goToUserDetailsVC {
            
        }
    }
    
    
}

 
 
