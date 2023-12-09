//
//  ContactsViewModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit

/// the view model of the contactsVC
class ContactsViewModel {
    
    private(set) var contacts: [ContactModel]
    
    init(contacts: [ContactModel]) {
        self.contacts = contacts
    }
    
    func createDestinationVC(using index: Int) -> UIViewController {
        let viewModel = ContactDetailsShowViewModel(contact: contacts[index])
        let destinationVC = ContactDetailsVC(viewModel: viewModel)
        return destinationVC
    }
}
