//
//  User.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//
import UIKit
 
struct User {
    
    weak var listener: DownloadListenerProtocol?
    var serviceController = NetworkEngine()
    
    var username: String!                       // login
    var profileImageURLString: String!          // avatar_url
    var repoCount: String!                         // repos

    var email: String!                          // email
    var location: String!                       // location
    var joinDate: String!                       // created
    var followersCount: Int!
    var followingCount: Int!
    var bio: String!
    
    private var image: UIImage?
    var downloadedImage: UIImage? {
        get {
            if image == nil {
                downloadImage()
            }
            return image
        }
    }
    
    
    init(_ username: String, _ profileURL: String) {
        self.username = username
        self.profileImageURLString = profileURL
    }
    
    init(_ username: String, _ profileURL: String, _ repoCount: String) {
        self.username = username
        self.profileImageURLString = profileURL
        self.repoCount = repoCount
    }
    
    init?(_ vm: UserVM) {
        guard let un = vm.username,
            let profileImageURL = vm.profileURLString,
            let repoCount = vm.repoCount else {
                return nil
        }
        self.username = un
        self.profileImageURLString = profileImageURL
        self.repoCount = repoCount
    }
    
    
    // MARK: - ACTIONS
     
    func downloadImage() -> () {
        guard let url  = buildImageDownloadURL() else { return }
        serviceController.fetchFromURL(urlString: url, success: { data in
            self.image = UIImage(data: data)
            self.listener?.didDownloadImage()
        }, failure: { (error) in })
    }
     
    
    func buildImageDownloadURL() -> String? {
        guard let imageName = imageName else {
            return nil
        }
        return "\(baseURL)\(imageName)"
    }
    
    
    
//    init?(_ vm: UserVM) {
//        guard let un = vm.username,
//            let profileImageURL = vm.profileURLString,
//            let repoCount = vm.repoCount,
//            let email = vm.email,
//            let location = vm.location,
//            let joinDate = vm.joinDate,
//            let fCount = vm.followersCount,
//            let followingCount = vm.followingCount,
//            let bio = vm.bio else {
//                return nil
//        }
//        self.username = un
//        self.profileImageURLString = profileImageURL
//        self.repoCount = repoCount
//        self.email = email
//        self.location = location
//        self.joinDate = joinDate
//        self.followersCount = fCount
//        self.followingCount = followingCount
//        self.bio = bio
//    }
    
}

 
