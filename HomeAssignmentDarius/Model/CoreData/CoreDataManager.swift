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
    
    private var mainContext: NSManagedObjectContext {
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
}
