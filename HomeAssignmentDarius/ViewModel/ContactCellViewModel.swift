//
//  ContactCellViewModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit

/// the view model for the cell
class ContactCellViewModel {
    private let contactModel: ContactModel
    
    init(contactModel: ContactModel) {
        self.contactModel = contactModel
    }
    
    func setContactNameLabelText() -> String {
        return contactModel.name
    }
    
    func showProfileImage() -> Bool {
        switch contactModel.image {
        case .initials:
            return false
        case .picture:
            return true
        }
    }
    
    func setProfileImage() -> UIImage? {
        guard let data = contactModel.profileImageData else {
            print("it goes here")
            return UIImage(named: "profileImage")
        }
        
        return UIImage(data: data)
    }
    
    func setInitialsText() -> String {
        return self.contactModel.name.getInitials()
    }
}
