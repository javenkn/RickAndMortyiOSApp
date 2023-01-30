//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by J on 1/29/23.
//

import Foundation

/// Object that represents a single API call
final class RMRequest {
    /// API constants
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired endpoint
    private let endpoint: RMEndpoint
    /// Path components for API, if any
    private let pathComponents: Set<String>
    /// Query parameters for API, if any
    private let queryParams: [URLQueryItem]
    
    /// Constructed url for the API in string format
    private var urlString: String {
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { string += "/\($0)"}
        }
        
        if !queryParams.isEmpty {
            string += "?"
            let argumentString = queryParams.compactMap {
                guard let value = $0.value else {
                    return nil
                }
                return "\($0.name)=\(value)"
                
            }.joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed and constructed API URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParams: Collection of query parameters
    public init(
        endpoint: RMEndpoint,
        pathComponents: Set<String> = [],
        queryParams: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParams = queryParams
    }
}
