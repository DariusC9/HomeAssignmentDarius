//
//  ContactData.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// Enum representing the status of a contact
enum ContactStatus: String, Codable {
    case active
    case inactive
}

/// Model used in decoding the JSON file
struct ContactData: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: ContactStatus
}
