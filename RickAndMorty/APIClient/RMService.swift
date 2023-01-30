//
//  RMService.swift
//  RickAndMorty
//
//  Created by J on 1/29/23.
//

import Foundation

/// Primary API service object to get Rick & Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick & Morty API call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object that we expect to get back
    ///   - completion: Call back with data or error
    public func execute<T: Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
