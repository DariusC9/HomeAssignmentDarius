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
    
    func createDestinationVC(using index: Int?) -> UIViewController {
        
        if index == nil {
            let model = ContactModel(id: 0, name: "", email: "", gender: "", status: .active, image: .initials, profileImageData: nil, phone: "")
            let viewModel = ContactDetailsAddViewModel(contact: model)
            let destinationVC = ContactDetailsVC(viewModel: viewModel)
            return destinationVC
        } else {
            let viewModel = ContactDetailsShowViewModel(contact: contacts[index ?? 0])
            let destinationVC = ContactDetailsVC(viewModel: viewModel)
            return destinationVC
        }
    }
}
