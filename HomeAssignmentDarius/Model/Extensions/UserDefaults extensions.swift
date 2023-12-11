//
//  UserDefaults extensions.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 11.12.2023.
//

import Foundation

extension UserDefaults {
    var cacheDate : Date {
        get {
            if let storedDate = UserDefaults.standard.object(forKey: "cacheDate") as? Date {
                return storedDate
            } else {
                let oldDate = DateCreator.createOldDate()
                UserDefaults.standard.set(oldDate, forKey: "cacheDate")
                return oldDate
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "cacheDate")
        }
    }
}
