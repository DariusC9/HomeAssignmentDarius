//
//  ContactDataFilter.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// object to filter ContactData based on the status
struct ContactDataFilter {
    let unfilteredData: [ContactData]
    
    func filter() -> [ContactData] {
        let filteredData = unfilteredData.filter { $0.status == .active }
        return filteredData
    }
}
