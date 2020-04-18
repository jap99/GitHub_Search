//
//  User.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//
 
 
struct User {
    
    var username: String!                       // login
    var profileImageURLString: String!          // avatar_url
    var repoCount: String!                         // repos

    var email: String!                          // email
    var location: String!                       // location
    var joinDate: String!                       // created
    var followersCount: Int!
    var followingCount: Int!
    var bio: String!
    
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

 
