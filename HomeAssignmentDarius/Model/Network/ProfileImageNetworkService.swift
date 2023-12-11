//
//  ProfileImageNetworkService.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 08.12.2023.
//

import Foundation

/// NetworkError enum for better validation
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
}

/// Class that will download the data for profile pictures
class ProfileImageNetworkService {
    let urlString = "https://picsum.photos/200/200"
    
    func fetchImageDataAsync() async throws -> Data {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw NetworkError.requestFailed(error)
        }
    }
}

