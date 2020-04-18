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
//
//
//}



struct UserListVM {
    
//    let users: [User]
    var usersVM: [UserVM] // { }
    
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
    
    func setupSearchBarPlaceholderTextColor() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
    }
}
