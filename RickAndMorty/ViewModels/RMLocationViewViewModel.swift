//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by J on 2/12/23.
//

import Foundation

final class RMLocationViewViewModel {
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    init() {
        
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listOfLocationsRequest, expecting: String.self) { result in
            switch result {
            case .success(let model):
                break
            case .failure(let failure):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
}
