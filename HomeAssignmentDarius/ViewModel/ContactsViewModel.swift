//
//  ContactsViewModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import Foundation

/// the view model of the contactsVC
class ContactsViewModel {
    
    private(set) var contacts: [ContactModel]
    
    init(contacts: [ContactModel]) {
        self.contacts = contacts
    }
}
