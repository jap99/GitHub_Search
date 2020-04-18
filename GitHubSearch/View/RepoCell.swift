//
//  RepoCell.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/6/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    
    func configure(_ vm: UserVM) {
        self.starsCountLabel.text = "123"
        self.nameLabel.text = "Javid"
        self.forksCountLabel.text = "Javid ABC"
    }
    
    
}
