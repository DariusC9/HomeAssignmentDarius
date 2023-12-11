//
//  DateCreator.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 11.12.2023.
//

import Foundation

struct DateCreator {
    
    static func createOldDate() -> Date {
        let dateString = "2009-01-01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let oldDate = dateFormatter.date(from: dateString) {
            return oldDate
        } else {
            return Date()
        }
    }
}
