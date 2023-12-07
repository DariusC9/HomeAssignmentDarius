//
//  ContactData.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// enum representing the status of a contact
enum ContactStatus: String, Codable {
    case active
    case inactive
}

/// model used in decoding the JSON file
struct ContactData: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: ContactStatus
}
