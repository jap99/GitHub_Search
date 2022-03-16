//
//  UserListVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.


import Foundation
import UIKit
 
struct UserListVM: TableViewModel {
    
    
    var tableTitle: String
    var user: User?
    var usersVM: [UserVM]  
    fileprivate var selectedIndexPath: IndexPath?
    var numberOfSections: Int {
        return 1
    }
 
 
    // MARK: - INIT
 
    init() {
        self.usersVM = [UserVM]()
    }
    
    
     // MARK: - ACTIONS
 
    func numberOfRowsInSection(_ section: Int) -> Int {
        self.usersVM.count
    }
 
    func userAt(_ indexPath: Int) -> UserVM {
        return self.usersVM[indexPath]
    }
    
   func viewModelForSelectedRow() -> UserDetailsVM? { // called in prepareForSegue:
      guard let selectedIndexPath = selectedIndexPath else {
              return nil
      }
      return UserDetailsVM(view: nil, model: usersVM[selectedIndexPath.row])
    }
    
    func setupSearchBarPlaceholderTextColor() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
    
    
    // MARK: - TABLE_VIEW_MODEL
    
    
    func numberOfRows() -> Int {
        self.usersVM.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModel? {  // called in cellForRow
        // builds vm for cell
        return TableViewCellViewModel(view: nil, cellText: "hello")
    }
    
    mutating func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func model(forIndexPath indexPath: IndexPath) -> AnyObject? {
        return AnyObject.self as AnyObject
//        let row = indexPath.row
//        if row < 0 || row >= self.coulorData.count {
//            return nil
//        }
//        return coulorData[row] as AnyObject
    }
    
    func viewDidAppear(_ animated: Bool) {
    }
    
    func setView(delegate: AnyObject?) { 
    }
}
