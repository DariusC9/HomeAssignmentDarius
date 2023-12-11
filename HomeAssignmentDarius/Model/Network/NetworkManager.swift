//
//  NetworkManager.swift
//  HomeAssignmentDarius
//
//  Created by Darius Couti on 07.12.2023.
//

import Foundation

/// Protocol needed for dependency inversion on NetworkManager
protocol NetworkService {
    var url: URL { get }
    func fetchData() async throws -> Data
}
/// Protocol needed for dependency inversion on NetworkManager
protocol ApiHandler {
    var decoder: JSONDecoder { get }
    func decodeHandler<T: Codable>(with data: Data) throws -> [T]
}

/// Main class responsable for API call using abstractions
class NetworkManager<T: Codable> {
    private let networkService: NetworkService
    private let apiHandler: ApiHandler
    
    init(networkService: NetworkService, apiHandler: ApiHandler) {
        self.networkService = networkService
        self.apiHandler = apiHandler
    }
    
    func fetchData() async throws -> [T] {
        let data = try await networkService.fetchData()
        return try apiHandler.decodeHandler(with: data)
    }
}
