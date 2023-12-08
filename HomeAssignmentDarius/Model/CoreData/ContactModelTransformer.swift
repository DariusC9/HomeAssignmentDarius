//
//  ContactModelTransformer.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation
import CoreData

/// object used to transform contact model into 'Contact' entity and viceversa
struct ContactModelTransformer {
    
    func transformModelIntoEntity(contactModel: ContactModel) -> Contact {
        let contactEntity = Contact(context: CoreDataManager.shared.mainContext)
        contactEntity.id = Int64(contactModel.id)
        contactEntity.name = contactModel.name
        contactEntity.email = contactModel.email
        contactEntity.gender = contactModel.gender
        contactEntity.status = contactModel.status.rawValue
        contactEntity.profileImage = contactModel.profileImageData
        return contactEntity
    }
    
    func transformModelsIntoEntities(contactModels: [ContactModel]) -> [Contact] {
        let contactEntities = contactModels.map { transformModelIntoEntity(contactModel: $0) }
        return contactEntities
    }
    
}
