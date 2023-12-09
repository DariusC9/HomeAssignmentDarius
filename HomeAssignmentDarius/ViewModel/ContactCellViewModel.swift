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
    
    func setProfileImage() -> UIImage? {
        
        switch contactModel.image {
        case .initials:
            return UIImage(named: "profileImage")
        case .picture:
            guard let data = contactModel.profileImageData else {
                return UIImage(named: "profileImage")
            }
            return UIImage(data: data)
        }
    }
}
