//
//  UserSearchVC.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import UIKit

class UserSearchVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
  
//    var usersArray: UserList?
    private var userListVM: UserListVM?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tv: UITableView!
    
    // MARK: - INIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let viewModel = userListVM {
            viewModel.viewDidAppear(animated)
        }
    }
    
    
    // MARK: - SETUP
    
    private func setup() {
        self.tv.delegate = self
        self.tv.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        setupSearchBarPlaceholderTextColor()
        self.searchBar.searchTextField.delegate = self

        view.layer.shadowOffset = CGSize(width: 0 , height:-12)
        NetworkEngine().searchForUsers(for: "jap") { [weak self] (users) in
            if !users!.isEmpty {
                print(users)
                self?.userListVM?.usersVM = users!.map(UserVM.init)
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
    
    func setupSearchBarPlaceholderTextColor() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
    
    // MARK: - TABLE VIEW
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.UserCellID, for: indexPath) as? UserCell,
            let userVM = self.userListVM?.userAt(indexPath.row) else {
//                fatalError("Table view cell not found")
                return UITableViewCell()
        }
        cell.configure(userVM)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(self.userListVM.numberOfRowsInSection(section))
        return 10
//        return self.userListVM?.numberOfRowsInSection(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
//        return self.userListVM == nil ? 0 : self.userListVM.numberOfSections
    }
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            guard let viewModel = self.userListVM else { return }
            viewModel.selectRow(atIndexPath: indexPath)
            self.performSegue(withIdentifier: "colorDetailSegue", sender: nil)
        }
        performSegue(withIdentifier: Constants.goToUserDetailsVC, sender: Any?.self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125.0
    }
 
    
    // MARK: - UITEXTFIELD_DELEGATE
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
    
    
    // MARK: - SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.goToUserDetailsVC {
            
        }
    }
    
    
}

 
 
