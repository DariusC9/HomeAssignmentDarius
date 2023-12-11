//
//  ContactDataFilter.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// Object to filter ContactData based on the status
struct ContactDataFilter {
    
    static func filter(unfilteredData: [ContactData]) -> [ContactData] {
        let filteredData = unfilteredData.filter { $0.status == .active }
        return filteredData
    }
}
