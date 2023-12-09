//
//  CoreDataManager.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation
import CoreData

class CoreDataManager {
    /// create it as a singleton
    static let shared = CoreDataManager()
    private init() {}

    private lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "HomeAssignmentDarius")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func save() {
        if mainContext.hasChanges {
            do {
                try mainContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func saveContactModelsIntoCoreData(contactModels: [ContactModel]) {
        let transformer = ContactModelTransformer()
        _ = transformer.transformModelsIntoEntities(contactModels: contactModels)
        save()
    }
    
    func fetchContactModels() -> [ContactModel] {
        let contactEntities = fetchContacts()
        let transformer = ContactModelTransformer()
        let contactModels = transformer.transformEntitiesIntoModels(contactEntities: contactEntities)
        return contactModels
    }
    
    private func fetchContacts() -> [Contact] {
        let fetchRequest: NSFetchRequest<Contact> = Contact.fetchRequest()

        do {
            let contacts = try mainContext.fetch(fetchRequest)
            return contacts
        } catch {
            print("Error fetching contacts: \(error.localizedDescription)")
            return []
        }
    }
}
