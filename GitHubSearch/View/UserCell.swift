//
//  UserCell.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var repoCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeProfileAvatarRound()
    }
    
    func configure(_ vm: UserVM) {
        let customColorSelectionView = UIView()
        
        DispatchQueue.main.async {
            self.profileImageView.image = vm.profileImage
            self.profileImageView.makeRounded()
            self.usernameLabel.text = vm.username
            self.repoCountLabel.text = vm.repoCount
        }
    }
    
    private func makeProfileAvatarRound() {
        self.layoutIfNeeded()
        DispatchQueue.main.async {
            self.profileImageView.layoutIfNeeded()
            self.profileImageView.isUserInteractionEnabled = true
            let square = self.profileImageView.frame.size.width < self.profileImageView.frame.height ? CGSize(width: self.profileImageView.frame.size.width, height: self.profileImageView.frame.size.width) : CGSize(width: self.profileImageView.frame.size.height, height:  self.profileImageView.frame.size.height)
            self.profileImageView.layer.cornerRadius = square.width / 2
            self.profileImageView.clipsToBounds = true
        }
    }
    
}
