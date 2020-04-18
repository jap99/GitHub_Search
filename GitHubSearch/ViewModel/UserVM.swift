//
//  ArticleVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation
import UIKit


struct UserVM {                 // Provides data to the UI
    
    private let user: User?
     
//    init() {}
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var username: String? {
        return self.user?.username ?? nil
    }
    
    var profileURLString: String? {
        return self.user?.profileImageURLString ?? nil
    }
    
    var repoCount: String? {
        return self.user?.repoCount ?? nil
    }
    
    var profileImage: UIImage? {
        var image: UIImage?
        if let url = URL(string: self.profileURLString!),
            let data = try? Data(contentsOf: url) {
            image = UIImage(data: data)?.resizeImage(size: CGSize(width: 50, height: 50))
        }
        return image ?? UIImage()
    }
 
    var email: String? {
        self.user?.email ?? nil
    }
    
    var location: String? {
        self.user?.location ?? nil
    }
    
    var joinDate: String? {
        self.user?.joinDate ?? nil
    }
    
    var followersCount: Int? {
        self.user?.followersCount ?? nil
    }
    
    var followingCount: Int? {
        self.user?.followingCount ?? nil
    }
    
    var bio: String? {
        self.user?.bio ?? nil
    }
    
    
    func setupSearchBarPlaceholderTextColor() {
          UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
      }
    
}

