//
//  TableViewCellVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


class TableViewCellViewModel: NSObject, CellViewModel {
    
    var cellText: String        // From CellViewModel
    private var view: TableViewCellDelegate?
    
    
    // MARK: - INIT
    
    init(view: TableViewCellDelegate?, cellText: String) {
        self.cellText = cellText
        super.init()
    }
    
    override init() {
        cellText = ""
        super.init()
    }
    
    
    // MARK: - ACTIONS (VIEW_MODEL)
    
    func setView(delegate: AnyObject?) -> Void {
        view = delegate as? TableViewCellDelegate
    }
    
    func viewDidAppear(_ animated: Bool) {
    }
    
    
}
