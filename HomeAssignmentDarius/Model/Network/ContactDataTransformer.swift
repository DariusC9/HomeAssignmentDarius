//
//  ContactDataTransformer.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation

/// object used to transform contact data into contact model
struct ContactDataTransformer {
    let data: [ContactData]

    func transformAsync() async -> [ContactModel] {
        var transformedModels: [ContactModel] = []

        await withTaskGroup(of: (ContactModel?, Error?).self) { group in
            for contactData in data {
                group.addTask {
                    await transformDataAsync(contactData: contactData)
                }
            }

            for await result in group {
                if let contactModel = result.0 {
                    transformedModels.append(contactModel)
                } else if let error = result.1 {
                    print("Error transforming data: \(error)")
                }
            }
        }

        return transformedModels
    }

    private func transformDataAsync(contactData: ContactData) async -> (ContactModel?, Error?) {
        do {
            if contactData.id % 2 == 0 {
                let contactModel = ContactModel(contactData: contactData)
                return (contactModel, nil)
            } else {
                let profileImageService = ProfileImageNetworkService()
                let data = try await profileImageService.fetchImageDataAsync()
                let contactModel = ContactModel(contactData: contactData, data: data)
                return (contactModel, nil)
            }
        } catch {
            return (nil, error)
        }
    }
}
