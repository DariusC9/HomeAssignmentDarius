//
//  ContactDetailsViewModels.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import Foundation

/// view model used to show details of a contact in ContactDetailsVC
class ContactDetailsShowViewModel: ContactDetailsVMProtocol {
    var contact: ContactModel
    
    init(contact: ContactModel) {
        self.contact = contact
    }
    
    func createTitle() -> String {
        return "Modifică contact"
    }
    
    func saveItem(firstName: String, lastName: String, telephone: String?, email: String?) {
        print("")
    }
}

/// view model used to add a new contact in ContactDetailsVC
class ContactDetailsAddViewModel: ContactDetailsVMProtocol {
    var contact: ContactModel
    
    init(contact: ContactModel) {
        self.contact = contact
    }
    
    func createTitle() -> String {
        return "Adaugă contact"
    }
    
    func saveItem(firstName: String, lastName: String, telephone: String?, email: String?) {
        print("")
    }
}
