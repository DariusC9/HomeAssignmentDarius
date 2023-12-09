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
        contactEntity.phone = contactModel.phone
        return contactEntity
    }
    
    func transformModelsIntoEntities(contactModels: [ContactModel]) -> [Contact] {
        let contactEntities = contactModels.map { transformModelIntoEntity(contactModel: $0) }
        return contactEntities
    }
    
    func transformEntityIntoModel(contactEntity: Contact) -> ContactModel {
        
        guard let name = contactEntity.name else {
            return ContactModel(id: 0, name: "Error", email: "", gender: "", status: .active, image: .initials, profileImageData: nil, phone: "")
        }
        
        
        let contactModel = ContactModel(id: Int(contactEntity.id),
                                        name: name,
                                        email: contactEntity.email ?? "",
                                        gender: contactEntity.gender ?? "",
                                        status: .active,
                                        image: contactEntity.id % 2 == 0 ? .initials : .picture,
                                        profileImageData: contactEntity.profileImage,
                                        phone: contactEntity.phone ?? "")
        return contactModel
    }
    
    func transformEntitiesIntoModels(contactEntities: [Contact]) -> [ContactModel] {
        let contactModels = contactEntities.map { transformEntityIntoModel(contactEntity: $0) }
        return contactModels
    }
}
