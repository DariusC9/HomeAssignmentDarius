//
//  ContactDetailsViewModels.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 09.12.2023.
//

import Foundation

/// view model used to show details of a contact in ContactDetailsVC
class ContactDetailsShowViewModel: ContactDetailsVMProtocol {
    
    func createTitle() -> String {
        return "Modifică contact"
    }
    
    
}
/// view model used to add a new contact in ContactDetailsVC
class ContactDetailsAddViewModel: ContactDetailsVMProtocol {
    
    func createTitle() -> String {
        return "Adaugă contact"
    }
    
    
}
