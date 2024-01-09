//
//  Networking.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// Class that implement the NetworkService protocol for Pago service
class APINetworkService: NetworkService {
    var url: URL = URL(string: "https://gorest.co.in/public/v2/users") ?? URL(fileURLWithPath: "https://gorest.co.in/public/v2/users")
    
    func fetchData() async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch(let error) {
            throw NetworkError.requestFailed(error)
        }
    }
}

/// Class that implement the ApiHandler protocol for Pago service
class SpecificApiHandler<T: Codable>: ApiHandler {
    var decoder: JSONDecoder
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func decodeHandler<T>(with data: Data) throws -> [T] where T : Decodable, T : Encodable {
        let decodedObject = try decoder.decode([T].self, from: data)
        return decodedObject
    }
}
