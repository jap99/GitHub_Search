//  UserDetailsVC.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.


import UIKit

class UserDetailsVC: UIViewController, UserDetailsDelegate {
    

    var vm: UserDetailsVM?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var joinDateLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var bioTextView: UITextView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tv: UITableView!

    
    // MARK: - INIT
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.view.backgroundColor = UIColor(displayP3Red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        self.profileImageView.makeRounded()
        setupSearchBarPlaceholderTextColor()
    }

    override func viewDidAppear(_ animated: Bool) {
        if let viewModel = vm {
            viewModel.viewDidAppear(animated)
        }
    }
    
    
    // MARK: - USER_DETAILS_DELEGATE
    
    func setNavigationTitle(_ title: String) -> Void {
        self.title = title
    }
    
    func setBackgroundColor() {
        
    }
     
    
    // MARK: - ACTIONS
    
    func setupSearchBarPlaceholderTextColor() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
    

}
