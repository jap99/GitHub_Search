//
//  TableViewModel.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation


protocol TableViewModel: ViewModel {
    
    var tableTitle: String { get set }
    
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModel?
    func selectRow(atIndexPath indexPath: IndexPath)
    func model(forIndexPath indexPath: IndexPath) -> AnyObject?
    func viewModelForSelectedRow() -> UserDetailsVM?
    
}
