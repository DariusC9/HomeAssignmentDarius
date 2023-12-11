//
//  SceneDelegate.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = setupNavigationController()
        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
        
        let cacheDate = UserDefaults.standard.cacheDate
        let currentDate = Date()
        // Check if network call is needed
        if cacheDate <= currentDate {
            let nextCacheDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)
            guard let nextCacheDate else { return }
            UserDefaults.standard.cacheDate = nextCacheDate
            // To make the cache system temporary, but will also delete added contacts manually
            CoreDataManager.shared.deleteAllContacts()
            cacheFilteredData { viewModel in
                let mainvc = self.setupMainViewController(with: viewModel)
                navigationController.pushViewController(mainvc, animated: true)
            }
        } else {
            let viewModel =  ContactsViewModel(contacts: CoreDataManager.shared.fetchContactModels())
            let mainvc = self.setupMainViewController(with: viewModel)
            navigationController.pushViewController(mainvc, animated: true)
        }
    }
    
    // Method used to cache filtered data
    private func cacheFilteredData(completion: @escaping (ContactsViewModel) -> Void) {
        Task {
            do {
                let contactData = try await fetchData()
                let filteredData = filterData(unfilteredData: contactData)
                let contactModels = await transformToContactModelAsync(contactData: filteredData)
                saveContactModelIntoCoreData(contactModel: contactModels)
                let viewModel = ContactsViewModel(contacts: CoreDataManager.shared.fetchContactModels())
                completion(viewModel)
            } catch {
                print("Error during data fetching: \(error.localizedDescription)")
                let viewModel = ContactsViewModel(contacts: [])
                completion(viewModel)
            }
        }
    }
    // Function used to fetch unfiltered data
    private func fetchData() async throws -> [ContactData] {
        let networkService = PagoNetworkService()
        let apiHandler = PagoApiHandler<ContactData>(decoder: JSONDecoder())
        let networkManager = NetworkManager<ContactData>(networkService: networkService, apiHandler: apiHandler)
        
        let contactData =  try await networkManager.fetchData()
        return contactData
        
    }
    // Function used to filter data
    private func filterData(unfilteredData: [ContactData]) -> [ContactData] {
        let filteredData = ContactDataFilter.filter(unfilteredData: unfilteredData)
        return filteredData
    }
    // Function used to transform contact data into contact model
    private func transformToContactModelAsync(contactData: [ContactData]) async -> [ContactModel] {
        let contactDataTransformer = ContactDataTransformer(data: contactData)
        return await contactDataTransformer.transformAsync()
    }
    // Function used to transform and save contact model into core data entity 'Contact'
    private func saveContactModelIntoCoreData(contactModel: [ContactModel]) {
        CoreDataManager.shared.saveContactModelsIntoCoreData(contactModels: contactModel)
    }
    
    // Function used to setup navigation controller
    private func setupNavigationController() -> UINavigationController {
        let nav = UINavigationController()
        nav.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.largeTitleTextAttributes = [
            .font: UIFont(name: "HelveticaNeue-Bold", size: 28) as Any,
            .foregroundColor: UIColor.black
        ]
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance

        return nav
    }
    // Function used to setup main view controller
    private func setupMainViewController(with viewModel: ContactsViewModel) -> ContactsVC {
        let mainVC = ContactsVC(viewModel: viewModel)
        return mainVC
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        CoreDataManager.shared.save()
    }


}

