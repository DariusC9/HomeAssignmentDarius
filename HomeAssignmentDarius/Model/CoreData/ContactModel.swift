//
//  ContactModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// enum that represents the type of pictures of a contact model
enum ContactImage {
    case initials
    case picture
}

/// represents a local model for the core data entity 'Contact'
struct ContactModel {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: ContactStatus
    let image: ContactImage
    let profileImageData: Data?
    
    init(contactData: ContactData) {
        self.id = contactData.id
        self.name = contactData.name
        self.email = contactData.email
        self.gender = contactData.gender
        self.status = contactData.status
        self.profileImageData = nil
        if id % 2 == 0 {
            self.image = .initials
        } else {
            self.image = .picture
        }
    }
    
    init(contactData: ContactData, data: Data?) {
        self.id = contactData.id
        self.name = contactData.name
        self.email = contactData.email
        self.gender = contactData.gender
        self.status = contactData.status
        if id % 2 == 0 {
            self.image = .initials
        } else {
            self.image = .picture
        }
        self.profileImageData = data
    }
}
