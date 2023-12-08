//
//  AppDelegate.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        cacheFilteredData()
        
        return true
    }
    /// method used to cache filtered data
    private func cacheFilteredData() {
        Task {
            do {
                let contactData = try await fetchData()
                let filteredData = filterData(unfilteredData: contactData)
                let contactModelData = transformToContactModel(contactData: filteredData)
                /// save contact model into Core Data 
            } catch {
                print("Error during data fetching: \(error.localizedDescription)")
            }
        }
    }
    /// method used to fetch unfiltered data
    private func fetchData() async throws -> [ContactData] {
        let networkService = PagoNetworkService()
        let apiHandler = PagoApiHandler<ContactData>(decoder: JSONDecoder())
        let networkManager = NetworkManager<ContactData>(networkService: networkService, apiHandler: apiHandler)
        
        let contactData =  try await networkManager.fetchData()
        print(contactData)
        return contactData
        
    }
    /// method used to filter data 
    private func filterData(unfilteredData: [ContactData]) -> [ContactData] {
        let contactFilter = ContactDataFilter(unfilteredData: unfilteredData)
        let filteredData = contactFilter.filter()
        print(filteredData)
        return filteredData
    }
    /// method used to transform contact data into contact model
    private func transformToContactModel(contactData: [ContactData]) -> [ContactModel] {
        let contactDataTransformer = ContactDataTransformer(data: contactData)
        let contactModel = contactDataTransformer.transform()
        return contactModel
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

