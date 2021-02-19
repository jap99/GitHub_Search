//
//  UserListVM.swift
//  GitHubSearch
//
//  Created by Javid Poornasir on 4/18/20.
//  Copyright © 2020 Javid Poornasir. All rights reserved.
//

import Foundation
import UIKit
 
//struct WeatherViewModel: Decodable {
//
//    let name: Dynamic<String>
//    var currentTemperature: TemperatureViewModel
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = Dynamic(try container.decode(String.self, forKey: .name))
//        self.currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
//    }
//
//    private enum CodingKeys: String, CodingKey {
//        case name
//        case currentTemperature = "main"
//    } 
//
//}

struct UserListVM: TableViewModel {
    
    
    var tableTitle: String
    var user: User?
    var usersVM: [UserVM] // { }
//    weak var view:
    fileprivate var selectedIndexPath: IndexPath?
    
    init() {
        self.usersVM = [UserVM]()
    }
    
//    private var weatherViewModels = [WeatherViewModel]()
//
//    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
//        self.weatherViewModels.append(vm)
//    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        self.usersVM.count
    }
    
    func userAt(_ indexPath: Int) -> UserVM {
        return self.usersVM[indexPath]
    }
    
//    func viewModelForSelectedRow() -> UserDetailsVM? { // called in prepareForSegue:
//    // builds vm for detailVC
//        guard let selectedIndexPath = selectedIndexPath else {
//            return nil
//        }
//        return UserDetailsVM(view: nil, model: usersVM[selectedIndexPath.row])
//    }
    
    func setupSearchBarPlaceholderTextColor() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
    
    
    // MARK: - TABLE_VIEW_MODEL
    
    
    func numberOfRows() -> Int {
        self.usersVM.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModel? {  // called in cellForRow
        // builds vm for cell
//            let row = indexPath.row
//            if row < 0 || row >= self.coulorData.count {
//                return nil
//            }
//            let cellText = coulorData[row].name
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
    
    func viewModelForSelectedRow() -> UserDetailsVM? {  // called in prepareForSegue:
        //    // builds vm for detailVC
        //        guard let selectedIndexPath = selectedIndexPath else {
        //            return nil
        //        }
        //        return UserDetailsVM(view: nil, model: usersVM[selectedIndexPath.row])
    }
    
    func viewDidAppear(_ animated: Bool) {
        <#code#>
    }
    
    func setView(delegate: AnyObject?) {
//        self.view = delegate as? ColorListTableViewControllerDelegate
    }
}
