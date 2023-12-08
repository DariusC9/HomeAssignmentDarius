//
//  ContactDataTransformer.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation

struct ContactDataTransformer {
    let data: [ContactData]
    
    func transform() -> [ContactModel] {
        let contactModel = data.map { transformData(contactData: $0) }
        return contactModel
    }
    
    private func transformData(contactData: ContactData) -> ContactModel {
        let contactModel = ContactModel(contactData: contactData)
        return contactModel
    }
}
