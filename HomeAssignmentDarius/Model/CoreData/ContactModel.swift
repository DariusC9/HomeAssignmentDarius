//
//  ContactModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// Enum that represents the type of pictures of a contact model
enum ContactImage {
    case initials
    case picture
}

/// Represents a local model for the core data entity 'Contact'
struct ContactModel {
    let id: Int
    var name: String
    var email: String?
    let gender: String
    let status: ContactStatus
    let image: ContactImage
    let profileImageData: Data?
    var phone: String?
    
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
        self.phone = ""
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
        self.phone = ""
    }
    
    init(id: Int, name: String, email: String, gender: String, status: ContactStatus, image: ContactImage, profileImageData: Data?, phone: String) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status
        self.image = image
        self.profileImageData = profileImageData
        self.phone = phone
    }
    
    mutating func updateContactModel(name: String, phone: String?, email: String?) {
        self.name = name
        self.phone = phone
        self.email = email
    }
}
