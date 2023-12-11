//
//  ContactsViewModel.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import UIKit

/// The view model of the contactsVC
class ContactsViewModel {
    private(set) var contacts: [ContactModel]
    private var data: Data? = nil
    private var image: ContactImage = .initials
    
    init(contacts: [ContactModel]) {
        self.contacts = contacts
    }
    
    func createDestinationVC(using index: Int?) -> ContactDetailsVC {
        if index == nil {
            let id = Generator.generateRandomNumber()
            if id % 2 != 0 {
                let profileNetwork = ProfileImageNetworkService()
                Task {
                    do {
                        data = try? await profileNetwork.fetchImageDataAsync()
                        image = .picture
                    }
                }
            } else {
                data = nil
                image = .initials
            }
            let model = ContactModel(id: id, name: "", email: "", gender: "", status: .active, image: image, profileImageData: data, phone: "")
            let viewModel = ContactDetailsAddViewModel(contact: model)
            let destinationVC = ContactDetailsVC(viewModel: viewModel)
            return destinationVC
        } else {
            let viewModel = ContactDetailsShowViewModel(contact: contacts[index ?? 0])
            let destinationVC = ContactDetailsVC(viewModel: viewModel)
            return destinationVC
        }
    }
    
    func updateContacts() {
        contacts = []
        let newContacts = CoreDataManager.shared.fetchContactModels()
        contacts = newContacts
    }
}
