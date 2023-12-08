//
//  ProfileImageNetworkService.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation

/// class that will download the data for profile pictures
class ProfileImageNetworkService {
    let urlString = "https://picsum.photos/200/200"
    
    func fetchImageData(completion: @escaping (Data?)-> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return 
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error {
                print("Error downloading image: \(error)")
                completion(nil)
            } else if let data {
                completion(data)
            } else {
                completion(nil)
            }
        }
        
        task.resume()
    }
}
